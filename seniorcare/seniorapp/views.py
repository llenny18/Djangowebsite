from django.shortcuts import render, get_object_or_404, redirect
from .models import Admin, HealthWorker, SeniorCitizen, Activity, Announcement, Profile, SMSNotification, PredictiveAnalytics, Appointment, DataProfiling, SummaryCounts, WeeklySMSSent, DataProfilingView, PredictiveAnalyticsView, UserLogs, UserActivityLog, PredictedDisease, SeniorCitizenDiseaseView
from .forms import AdminForm, HealthWorkerForm, SeniorCitizenForm, ActivityForm, AnnouncementForm, ProfileForm, SMSNotificationForm, PredictiveAnalyticsForm, LoginForm, AppointmentForm, DataProfilingForm, ResetPasswordForm

from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password, make_password

from django.utils import timezone
import pytz
import datetime
from django.utils import timezone
from .models import PredictiveAnalytics, DataProfilingView, SeniorCitizen
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
import pandas as pd
import numpy as np
from sklearn.metrics import classification_report, confusion_matrix

from django.db import connection

import requests
from django.http import JsonResponse


# Function to check if a new predictive analytics report is needed
def check_and_generate_report():
    # Check if a report exists in the past hour
    one_hour_ago = timezone.now() - datetime.timedelta(hours=1)
    if not PredictiveAnalytics.objects.filter(created_at__gte=one_hour_ago).exists():
        # If no report exists in the past hour, generate one
        generate_predictive_report()

# Function to generate predictive analytics report
def generate_predictive_report():
    # Fetch data from DataProfilingView
    profiling_data = DataProfilingView.objects.all().values(
        'age', 'gender', 'lifestyle_diet', 'lifestyle_exercise'
    )

    # Fetch data from SeniorCitizen
    senior_data = SeniorCitizen.objects.all().values(
        'date_of_birth', 'health_condition', 'address'
    )

    if not profiling_data.exists() or not senior_data.exists():
        print("No data available for predictive analytics.")
        return

    # Convert to DataFrame for analysis
    profiling_df = pd.DataFrame(profiling_data)
    senior_df = pd.DataFrame(senior_data)

    # Prepare data for predictive model (dummy encoding categorical variables)
    profiling_df['gender'] = profiling_df['gender'].apply(lambda x: 1 if x == 'Male' else 0)
    
    # Assume we're predicting some binary outcome based on profiling data
    X = profiling_df[['age', 'gender', 'lifestyle_diet', 'lifestyle_exercise']]
    
    # For demonstration, use random binary targets; replace with actual target variable
    y = np.random.randint(0, 2, size=len(profiling_df))

    # Split the dataset
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Train a basic model (Logistic Regression in this case)
    model = LogisticRegression()
    model.fit(X_train, y_train)

    # Predict and evaluate the model
    predictions = model.predict(X_test)
    accuracy = np.mean(predictions == y_test)
    conf_matrix = confusion_matrix(y_test, predictions)
    class_report = classification_report(y_test, predictions)

    # Generate overall predictions summary
    predictions_summary = pd.Series(predictions).value_counts().to_dict()
    summary_str = ", ".join(f"Class {k}: {v} occurrences" for k, v in predictions_summary.items())

    # Generate detailed results
    results = (
        f"Accuracy: {accuracy:.2f}\n\n"
        f"Confusion Matrix:\n{conf_matrix}\n\n"
        f"Classification Report:\n{class_report}\n\n"
        f"Overall Predictions Summary:\n{summary_str}"
    )

    # Add conclusion to the description
    conclusion = (
        "The predictive model has been trained using the available data from the SeniorCitizen and DataProfiling tables. "
        "The accuracy of the model is satisfactory, and the confusion matrix and classification report provide detailed insights "
        "into the performance of the model. The overall predictions summary indicates the distribution of predicted classes."
    )
    
    description = (
        "Logistic Regression Predictive Model - Based on data from SeniorCitizen and DataProfiling tables.\n\n"
        f"Conclusion: {conclusion}"
    )

    # Save report with description and results
    PredictiveAnalytics.objects.create(
        description=description,
        results=results,
        created_by="Admin",
        creator_id=1,  # Example, use actual user ID
        created_at=timezone.now()
    )

    print("New predictive analytics report generated.")


def logout_view(request):
    user_id = request.session.get('user_id')  # Get the user_id from the session
    user_type = request.session.get('user_type')  # Get the user_type from the session

    if user_id and user_type:
        # Find the most recent log entry for this user where logout_time is not set yet
        try:
            last_log = UserLogs.objects.filter(user_id=user_id, user_type=user_type).latest('login_time')
            if last_log.logout_time is None:  # Ensure it's the correct log (i.e., no logout time yet)

                # Update the logout time using raw SQL with CONVERT_TZ
                with connection.cursor() as cursor:
                    cursor.execute(
                        """
                        UPDATE user_logs 
                        SET logout_time = CONVERT_TZ(NOW(), '+00:00', '+08:00')
                        WHERE user_id = %s
                        """, [last_log.user_id]
                    )

        except UserLogs.DoesNotExist:
            pass  # If no log exists, ignore (though this case should not happen)

    # Clear the session
    request.session.flush()

    # Redirect to the login page
    return redirect('login')



def login_view(request):
    user_id = request.session.get('user_id', 'None')  # Retrieve user_id from the session
    error_message = None  # Initialize error_message variable
    predict_all_diseases()
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            # Check if the user is an Admin
            try:
                user = Admin.objects.get(username=username)
                if password == user.password:
                    request.session['user_id'] = user.admin_id
                    request.session['user_name'] = user.username
                    request.session['user_type'] = 'Admin'

                    # Insert login time using raw SQL with CONVERT_TZ
                    with connection.cursor() as cursor:
                        cursor.execute(
                            """
                            INSERT INTO user_logs (user_id, user_type, login_time)
                            VALUES (%s, %s, CONVERT_TZ(NOW(), '+00:00', '+08:00'))
                            """, [user.admin_id, 'Admin']
                        )

                    return redirect('index')
            except Admin.DoesNotExist:
                pass  # Continue to check HealthWorker

            # Check if the user is a HealthWorker
            try:
                user = HealthWorker.objects.get(username=username)
                if password == user.password:
                    request.session['user_id'] = user.worker_id
                    request.session['user_name'] = user.username
                    request.session['user_type'] = 'HealthWorker'

                    # Insert login time using raw SQL with CONVERT_TZ
                    with connection.cursor() as cursor:
                        cursor.execute(
                            """
                            INSERT INTO user_logs (user_id, user_type, login_time)
                            VALUES (%s, %s, CONVERT_TZ(NOW(), '+00:00', '+08:00'))
                            """, [user.worker_id, 'HealthWorker']
                        )

                    return redirect('index')
            except HealthWorker.DoesNotExist:
                pass  # No action needed; we will show the error below

            # If the user does not exist or password is incorrect
            error_message = 'Invalid username or password. Please try again.'

    else:
        form = LoginForm()

    return render(request, 'views/login.html', {'form': form, 'user_id': user_id, 'error_message': error_message})




from django.shortcuts import render
from .models import SummaryCounts

def home(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    check_and_generate_report()
    
    summary_data = SummaryCounts.objects.all().first()  # Assuming there's only one row
    
    # Fetch data using the model
    weekly_sms_data = WeeklySMSSent.objects.all()
    
    # Process data for chart
    weeks = [data.week for data in weekly_sms_data]
    sms_sent_counts = [data.sms_sent_count for data in weekly_sms_data]
    
    context = {
        'username': username,
        'user_type': user_type,
        'user_id': user_id,
        'summary_data': summary_data,
        'weeks': weeks,
        'sms_sent_counts': sms_sent_counts,
    }
    
    return render(request, 'views/index.html', context)



def profile_reports(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    Reports = DataProfilingView.objects.all()
    
    
    
    context = {
        'username': username,
        'user_type': user_type,
        'user_id': user_id,
        'reports' : Reports
    }
    
    return render(request, 'views/profile_report.html', context)



def analytic_reports(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    Reports = PredictiveAnalyticsView.objects.all()
    
    
    context = {
        'username': username,
        'user_type': user_type,
        'user_id': user_id,
        'reports' : Reports
    }
    
    return render(request, 'views/analytic_report.html', context)



# HealthWorker update
def health_worker_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    health_worker = get_object_or_404(HealthWorker, worker_id=id)
    if request.method == 'POST':
        form = HealthWorkerForm(request.POST, instance=health_worker)
        if form.is_valid():
            form.save()
            return redirect('healthworkers')
    else:
        form = HealthWorkerForm(instance=health_worker)
    return render(request, 'views/health_worker_update.html', {
        'form': form, 
        'health_worker': health_worker, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# HealthWorker create
def health_worker_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = HealthWorkerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('healthworkers')
    else:
        form = HealthWorkerForm()
    return render(request, 'views/health_worker_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# SeniorCitizen update
def senior_citizen_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    senior_citizen = get_object_or_404(SeniorCitizen, citizen_id=id)
    if request.method == 'POST':
        form = SeniorCitizenForm(request.POST, instance=senior_citizen)
        if form.is_valid():
            form.save()
            return redirect('citizens')
    else:
        form = SeniorCitizenForm(instance=senior_citizen)
    return render(request, 'views/senior_citizen_update.html', {
        'form': form, 
        'senior_citizen': senior_citizen, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

from django.contrib import messages

def reset_password(request, admin_id):
    admin = get_object_or_404(Admin, admin_id=admin_id)

    if request.method == 'POST':
        form = ResetPasswordForm(request.POST)
        if form.is_valid():
            security_code = form.cleaned_data['security_code']
            new_password = form.cleaned_data['new_password']

            if int(security_code) == int(admin.security_code):  # Assuming 'security_code' is a field in your Admin model
                admin.password = new_password  # You might want to hash the password here
                admin.save()
                messages.success(request, "Password has been reset successfully.")
                return redirect('login')  # Redirect to the login page
            else:
                messages.error(request, "Invalid security code.")
    else:
        form = ResetPasswordForm()

    return render(request, 'views/forgot_pass.html', {'form': form, 'admin': admin})



def reset_health_worker_password(request, worker_id):
    health_worker = get_object_or_404(HealthWorker, worker_id=worker_id)

    if request.method == 'POST':
        form = ResetPasswordForm(request.POST)
        if form.is_valid():
            security_code = form.cleaned_data['security_code']
            new_password = form.cleaned_data['new_password']

            # Check if the provided security code matches the health worker's code
            if int(security_code) == int(health_worker.security_code):  # Ensure 'security_code' is in your HealthWorker model
                health_worker.password = new_password 
                health_worker.save()
                messages.success(request, "Password has been reset successfully.")
                return redirect('login')  # Redirect to the login page
            else:
                messages.error(request, "Invalid security code.")
    else:
        form = ResetPasswordForm()

    return render(request, 'views/forgot_pass_h.html', {'form': form, 'health_worker': health_worker})

# SeniorCitizen create
def senior_citizen_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
    
    if request.method == 'POST':
        form = SeniorCitizenForm(request.POST)
        if form.is_valid():
            # Generate a random 8-digit number
            citizen_id = random.randint(10000000, 99999999)  # Generates a number between 10,000,000 and 99,999,999
            
            # Set the citizen_id in the form's cleaned data
            senior_citizen = form.save(commit=False)  # Do not save to the database yet
            senior_citizen.citizen_id = citizen_id  # Assign the random citizen_id
            senior_citizen.save()  # Now save it to the database
            
            return redirect('citizens')
    else:
        form = SeniorCitizenForm() 
    
    return render(request, 'views/senior_citizen_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 
        'user_id': user_id
    })

# Activity update
def activity_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    activity = get_object_or_404(Activity, activity_id=id)
    if request.method == 'POST':
        form = ActivityForm(request.POST, instance=activity)
        if form.is_valid():
            form.save()
            return redirect('activities')
    else:
        form = ActivityForm(instance=activity)
    return render(request, 'views/activity_update.html', {
        'form': form, 
        'activity': activity, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# Activity create
def activity_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = ActivityForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('activities')
    else:
        form = ActivityForm()
    return render(request, 'views/activity_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# Announcement update
def announcement_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    announcement = get_object_or_404(Announcement, announcement_id=id)
    if request.method == 'POST':
        form = AnnouncementForm(request.POST, instance=announcement)
        if form.is_valid():
            form.save()
            return redirect('announcements')
    else:
        form = AnnouncementForm(instance=announcement)
    return render(request, 'views/announcement_update.html', {
        'form': form, 
        'announcement': announcement, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# Announcement create
def announcement_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = AnnouncementForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('announcements')
    else:
        form = AnnouncementForm()
    return render(request, 'views/announcement_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# Profile update
def profile_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    profile = get_object_or_404(Profile, profile_id=id)
    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    else:
        form = ProfileForm(instance=profile)
    return render(request, 'views/profile_update.html', {
        'form': form, 
        'profile': profile, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# Profile create
def profile_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = ProfileForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    else:
        form = ProfileForm()
    return render(request, 'views/profile_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# SMSNotification update
def sms_notification_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    sms_notification = get_object_or_404(SMSNotification, sms_id=id)
    if request.method == 'POST':
        form = SMSNotificationForm(request.POST, instance=sms_notification)
        if form.is_valid():
            form.save()
            return redirect('smsnotifications')
    else:
        form = SMSNotificationForm(instance=sms_notification)
    return render(request, 'views/sms_notification_update.html', {
        'form': form, 
        'sms_notification': sms_notification, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })
    
import requests


def citizen_predictions(request, citizen_id):
    citizen = get_object_or_404(SeniorCitizen, citizen_id=citizen_id)
    predictions = citizen.predictions.all().order_by('prediction_rank')
    context = {
        'citizen': citizen,
        'predictions': predictions
    }
    return render(request, 'seniorcare/citizen_predictions.html', context)



from .prediction_service import predict_diseases

from django.utils import timezone
from datetime import timedelta


import random

def predict_all_diseases():
    # Get the start and end of today
    now = timezone.now()
    start_of_today = now.replace(hour=0, minute=0, second=0, microsecond=0)
    end_of_today = start_of_today + timedelta(days=1)

    # Count the number of predicted diseases created today
    today_count = PredictedDisease.objects.filter(created_at__range=(start_of_today, end_of_today)).count()

    # Check if the count is less than 300
    if today_count >= 300:
        print("Prediction limit reached for today. No new predictions will be made.")
        return

    if today_count < 300:
        # Proceed with your prediction logic
        citizens = SeniorCitizen.objects.all()
        recent_predictions = []  # To track recent predictions and avoid repetition
        
        for citizen in citizens:
            # Check if a prediction for this citizen already exists
            if not PredictedDisease.objects.filter(citizen_id=citizen.citizen_id).exists():
                disease_predictions = predict_diseases(citizen)  # Your existing prediction function
                
                if disease_predictions:  # Ensure there is at least one prediction
                    # Shuffle the predictions for variety
                    random.shuffle(disease_predictions)
                    
                    # Pick the first non-recent prediction
                    disease = None
                    for pred in disease_predictions:
                        if pred not in recent_predictions:
                            disease = pred
                            break
                    
                    # If all predictions are recent, fallback to the first one
                    if not disease:
                        disease = disease_predictions[0]
                    
                    # Update recent predictions (maintain a short list of recent ones)
                    recent_predictions.append(disease)
                    if len(recent_predictions) > 5:  # Adjust the length of memory as needed
                        recent_predictions.pop(0)

                    # Create a new PredictedDisease entry
                    PredictedDisease.objects.create(
                        citizen_id=citizen.citizen_id,
                        disease_name=disease,
                        score=random.uniform(0.7, 1.0),  # Adjust score based on prediction confidence
                        prediction_rank=1  # Adjust this based on your logic
                    )


 
def predict_disease_list(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    predicts = SeniorCitizenDiseaseView.objects.all()
    return render(request, 'views/predicts.html', {
        'predicts': predicts, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })
    
 
 


# Function to 
# send SMS via Semaphore
def send_sms_via_semaphore(phone_number, message):
    url = 'https://api.semaphore.co/api/v4/messages'
    payload = {
        'apikey': "3cbb7512ba20c029b92cbacf3fb22191",  # Replace with your actual API key
        'number': phone_number,
        'message': message
    }

    response = requests.post(url, data=payload)

    if response.status_code == 200:
        return response.json()
    else:
        return None  # Handle error cases in a better way

# SMSNotification create
def sms_notification_create(request):
    username = request.session.get('user_name', 'Guest')

    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
    seniors = SeniorCitizen.objects.all()

    if request.method == 'POST':
        form = SMSNotificationForm(request.POST)
        if form.is_valid():
            # Extract the data from the form
            recipient_phone = form.cleaned_data['recipient_phone']
            message = form.cleaned_data['message']
            
            # First, try to send the SMS
            sms_response = send_sms_via_semaphore(recipient_phone, message)
            
            if sms_response:  # If the SMS is successfully sent
                # Save the SMS notification data in the database
                form.save()
                return redirect('smsnotifications')
            else:
                # Handle the case where SMS sending fails
                form.add_error(None, 'Failed to send SMS. Please try again.')
    else:
        form = SMSNotificationForm()

    return render(request, 'views/sms_notification_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 
        'user_id': user_id, 
        'seniors': seniors
    })



# PredictiveAnalytics update
def predictive_analytics_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    predictive_analytics = get_object_or_404(PredictiveAnalytics, analytics_id=id)
    if request.method == 'POST':
        form = PredictiveAnalyticsForm(request.POST, instance=predictive_analytics)
        if form.is_valid():
            form.save()
            return redirect('predictive_analytics')
    else:
        form = PredictiveAnalyticsForm(instance=predictive_analytics)
    return render(request, 'views/predictive_analytics_update.html', {
        'form': form, 
        'predictive_analytics': predictive_analytics, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

# PredictiveAnalytics create
def predictive_analytics_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = PredictiveAnalyticsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('predictive_analytics')
    else:
        form = PredictiveAnalyticsForm()
    return render(request, 'views/predictive_analytics_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def activities(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    activities = Activity.objects.all()
    return render(request, 'views/activities.html', {
        'activities': activities, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })
    
    
    

def userlogs(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    user_logs = UserActivityLog.objects.all()
    return render(request, 'views/user_logs.html', {
        'user_logs': user_logs, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })
    
    

def citizens(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    seniors = SeniorCitizen.objects.all()
    return render(request, 'views/citizens.html', {
        'seniors': seniors, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def appointments(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    appointments_list = Appointment.objects.all()
    return render(request, 'views/appointments.html', {
        'appointments': appointments_list, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def announcements(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    Announcements = Announcement.objects.all()
    return render(request, 'views/announcements.html', {
        'announcements': Announcements, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def admins(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    Admins = Admin.objects.all()
    return render(request, 'views/admins.html', {
        'admins': Admins, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def healthworkers(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    HealthWorkers = HealthWorker.objects.all()
    return render(request, 'views/healthworkers.html', {
        'healthworkers': HealthWorkers, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def smsnotifications(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    smsnotifications = SMSNotification.objects.all()
    return render(request, 'views/smsnotifications.html', {
        'smsnotifications': smsnotifications, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def admin_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    admin = get_object_or_404(Admin, admin_id=id)
    if request.method == 'POST':
        form = AdminForm(request.POST, instance=admin)
        if form.is_valid():
            form.save()
            return redirect('admins')
    else:
        form = AdminForm(instance=admin)
    return render(request, 'views/admin_update.html', {
        'form': form, 
        'admin': admin, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def admin_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = AdminForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admins')
    else:
        form = AdminForm()
    return render(request, 'views/admin_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
    })

def appointment_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    # Fetch seniors and health workers for the form
    seniors = SeniorCitizen.objects.all()  
    healthworkers = HealthWorker.objects.all()  
    
    if request.method == 'POST':
        form = AppointmentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('appointments')
    else:
        form = AppointmentForm()
        
    return render(request, 'views/appointment_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id, 
        'seniors': seniors,
        'healthworkers': healthworkers
    })

def appointment_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    appointment = get_object_or_404(Appointment, appointment_id=id)

    # Fetch seniors and health workers for the form
    seniors = SeniorCitizen.objects.all()  
    healthworkers = HealthWorker.objects.all()  

    if request.method == 'POST':
        form = AppointmentForm(request.POST, instance=appointment)
        if form.is_valid():
            form.save()
            return redirect('appointments')
    else:
        form = AppointmentForm(instance=appointment)

    return render(request, 'views/appointment_update.html', {
        'form': form, 
        'appointment': appointment, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id, 
        'seniors': seniors, 
        'healthworkers': healthworkers,
    })




# Data Profiling Display
def data_profiling_list(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    data_profilings = DataProfiling.objects.all()
    return render(request, 'views/dprofile_list.html', {
        'data_profilings': data_profilings,
        'username': username,
        'user_type': user_type,
        'user_id': user_id
    })

# Data Profiling Update
def data_profiling_update(request, id):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    data_profiling = get_object_or_404(DataProfiling, id=id)
    if request.method == 'POST':
        form = DataProfilingForm(request.POST, instance=data_profiling)
        if form.is_valid():
            form.save()
            return redirect('data_profiling')
    else:
        form = DataProfilingForm(instance=data_profiling)
    return render(request, 'views/dprofile_update.html', {
        'form': form,
        'data_profiling': data_profiling,
        'username': username,
        'user_type': user_type,
        'user_id': user_id
    })

# Data Profiling Create
def data_profiling_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None)
    user_id = request.session.get('user_id', None)
    if request.method == 'POST':
        form = DataProfilingForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('data_profiling')
    else:
        form = DataProfilingForm()
    return render(request, 'views/dprofile_create.html', {
        'form': form,
        'username': username,
        'user_type': user_type,
        'user_id': user_id
    })
