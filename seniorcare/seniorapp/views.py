from django.shortcuts import render, get_object_or_404, redirect
from .models import Admin, HealthWorker, SeniorCitizen, Activity, Announcement, Profile, SMSNotification, PredictiveAnalytics, Appointment, DataProfiling
from .forms import AdminForm, HealthWorkerForm, SeniorCitizenForm, ActivityForm, AnnouncementForm, ProfileForm, SMSNotificationForm, PredictiveAnalyticsForm, LoginForm, AppointmentForm, DataProfilingForm

from django.contrib.auth import authenticate, login
from django.contrib.auth.hashers import check_password, make_password

def logout_view(request):
    # Clear the session
    request.session.flush()
    # Redirect to the login page
    return redirect('login')

def login_view(request):
    user_id = request.session.get('user_id', 'None')  # Retrieve user_id from the session
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
                    return redirect('index')
            except Admin.DoesNotExist:
                pass

            # Check if the user is a HealthWorker
            try:
                user = HealthWorker.objects.get(username=username)
                if password == user.password:
                    request.session['user_id'] = user.worker_id
                    request.session['user_name'] = user.username
                    request.session['user_type'] = 'HealthWorker'
                    return redirect('index')
            except HealthWorker.DoesNotExist:
                pass

            # If user does not exist or password is incorrect
            return render(request, 'views/login.html', {'form': form, 'error_message': 'Invalid username or password'})

    else:
        form = LoginForm()

    return render(request, 'views/login.html', {'form': form, 'user_id': user_id})

def home(request):
    username = request.session.get('user_name', 'Guest')  # Default to 'Guest' if no user is logged in
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    return render(request, 'views/index.html', {'username': username, 'user_type': user_type, 'user_id': user_id})

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

# SeniorCitizen create
def senior_citizen_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = SeniorCitizenForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('citizens')
    else:
        form = SeniorCitizenForm() 
    return render(request, 'views/senior_citizen_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
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

# SMSNotification create
def sms_notification_create(request):
    username = request.session.get('user_name', 'Guest')
    user_type = request.session.get('user_type', None) 
    user_id = request.session.get('user_id', None)  # Retrieve user_id from the session
 # Retrieve user_type from the session
    if request.method == 'POST':
        form = SMSNotificationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('smsnotifications')
    else:
        form = SMSNotificationForm()
    return render(request, 'views/sms_notification_create.html', {
        'form': form, 
        'username': username, 
        'user_type': user_type, 'user_id': user_id
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
