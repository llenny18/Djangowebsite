from django.db import models


class UserLogs(models.Model):
    logs = models.AutoField(primary_key=True)  # For auto-incrementing Logs field
    user_id = models.IntegerField()  # user_id is an integer
    user_type = models.CharField(max_length=255)  # user_type is a varchar with a max length of 255
    login_time = models.DateTimeField()  # login_time is a datetime
    logout_time = models.DateTimeField()  # logout_time is a datetime

    class Meta:
        db_table = 'user_logs'  # The database table name
        managed = False  # Specify if the model should be managed by Django or not
        

class UserActivityLog(models.Model):
    logs = models.IntegerField(primary_key=True)  # Corresponding to 'Logs'
    username = models.CharField(max_length=255)  # Computed field for 'username'
    email = models.CharField(max_length=255)  # Computed field for 'email'
    user_type = models.CharField(max_length=255)  # user_type from user_logs
    login_time = models.CharField(max_length=255)  # login_time from user_logs
    logout_time = models.CharField(max_length=255)  # logout_time from user_logs

    class Meta:
        db_table = 'user_activity_log'  # Referencing the view in the database
        managed = False  # Since it's a view, Django won't manage it (no migrations)



class SeniorCitizenView(models.Model):
    id = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=50, null=True)
    last_name = models.CharField(max_length=50, null=True)
    date_of_birth = models.DateField(null=True)
    age = models.DateField(null=True)
    health_condition = models.CharField(max_length=100, null=True)
    gender = models.CharField(max_length=10, null=True)
    address = models.CharField(max_length=100, null=True)
    phone = models.CharField(max_length=15, null=True)
    lifestyle = models.CharField(max_length=355)
    medication = models.CharField(max_length=355)
    checkups = models.CharField(max_length=355)
    created_at = models.DateTimeField()
    created_date = models.DateField()
    created_week = models.CharField(max_length=20)
    created_month = models.CharField(max_length=20)
    created_year = models.CharField(max_length=4)
    created_week_number = models.IntegerField()

    class Meta:
        managed = False  # No migrations will be created for this model
        db_table = 'seniorcitizen_view'  # Matches the name of the view in the database


class PredictiveAnalyticsView(models.Model):
    analytics_id = models.IntegerField(primary_key=True)
    description = models.TextField()
    results = models.TextField()
    created_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    creator_id = models.IntegerField()
    created_at = models.DateTimeField()
    created_date = models.DateField()
    created_week = models.CharField(max_length=10)
    created_month = models.CharField(max_length=10)
    created_year = models.CharField(max_length=10)
    created_week_number = models.IntegerField()

    class Meta:
        db_table = 'predictiveanalytics_view'
        managed = False

class DataProfilingView(models.Model):
    id = models.AutoField(primary_key=True)
    address = models.CharField(max_length=255)
    gender = models.CharField(max_length=6, choices=[('Male', 'Male'), ('Female', 'Female')])
    age = models.IntegerField()
    lifestyle_diet = models.BooleanField(default=False)
    lifestyle_exercise = models.BooleanField(default=False)
    lifestyle_others = models.CharField(max_length=255, blank=True, null=True)
    medical_history_past_illness = models.TextField(blank=True, null=True)
    medical_history_treatments = models.TextField(blank=True, null=True)
    medical_history_ongoing_medications = models.TextField(blank=True, null=True)
    medical_history_checkups = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField()
    created_date = models.DateField()
    created_week = models.CharField(max_length=10)
    created_month = models.CharField(max_length=10)
    created_year = models.CharField(max_length=10)
    created_week_number = models.IntegerField()

    class Meta:
        db_table = 'dataprofiling_view'
        managed = False


class Admin(models.Model):
    admin_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    security_code = models.IntegerField()
    status = models.CharField(max_length=255)

    class Meta:
        db_table = 'admin'
        managed = False

class HealthWorker(models.Model):
    worker_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    security_code = models.IntegerField()
    status = models.CharField(max_length=255)

    class Meta:
        db_table = 'healthworker'
        managed = False


class TopHealthConditionsView(models.Model):
    health_condition = models.CharField(max_length=255)
    condition_count = models.IntegerField()

    class Meta:
        db_table = 'top_health_conditions'
        managed = False
class TopPredictedDiseasesView(models.Model):
    disease_name = models.CharField(max_length=255)
    disease_count = models.IntegerField()

    class Meta:
        db_table = 'top_predicted_diseases'
        managed = False


class SVMAnalytics(models.Model):
    id = models.AutoField(primary_key=True)
    disease_name = models.CharField(max_length=100)
    average_score = models.FloatField()
    prediction_count = models.IntegerField()

    class Meta:
        db_table = 'svm_analytics'
        managed = False  # This is a view, so Django should not manage it


class DiseaseCount(models.Model):
    category_disease = models.CharField(max_length=255)
    count = models.IntegerField()

    class Meta:
        db_table = 'disease_count'  # The name of the MySQL view
        managed = False  # Django will not manage this model


class TopCheckupsView(models.Model):
    checkups = models.CharField(max_length=255)
    checkup_count = models.IntegerField()

    class Meta:
        db_table = 'top_checkups'
        managed = False



class SeniorCitizen(models.Model):
    citizen_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    address = models.CharField(max_length=255)
    health_condition = models.CharField(max_length=255)
    checkups = models.CharField(max_length=255)
    lifestyle = models.CharField(max_length=255)
    medication = models.CharField(max_length=255)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=255)

    class Meta:
        db_table = 'seniorcitizen'
        managed = False

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.citizen_id})"



from django.db import models
import joblib
import pickle
import os
import numpy as np
from sklearn.preprocessing import MultiLabelBinarizer
from datetime import datetime

class SeniorCitizenAge(models.Model):
    citizen_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    address = models.CharField(max_length=255)
    health_condition = models.CharField(max_length=255)
    checkups = models.CharField(max_length=255)
    lifestyle = models.CharField(max_length=255)
    medication = models.CharField(max_length=255)
    age = models.CharField(max_length=255)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=255)

    class Meta:
        db_table = 'seniorcitizen_with_age'
        managed = False

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.citizen_id})"

    def calculate_age(self):
        """Calculate age from date of birth."""
        if not self.date_of_birth:
            return None
        today = datetime.today()
        age = today.year - self.date_of_birth.year - ((today.month, today.day) < (self.date_of_birth.month, self.date_of_birth.day))
        return age

    def map_age_to_factor(self, age):
        """Map the calculated age to the corresponding age range factor."""
        if 1 <= age <= 10:
            return "age_1_10"
        elif 11 <= age <= 20:
            return "age_11_20"
        elif 21 <= age <= 30:
            return "age_21_30"
        elif 31 <= age <= 40:
            return "age_31_40"
        elif 41 <= age <= 50:
            return "age_41_50"
        elif 51 <= age <= 60:
            return "age_51_60"
        elif 61 <= age <= 70:
            return "age_61_70"
        elif 71 <= age <= 80:
            return "age_71_80"
        elif 81 <= age <= 90:
            return "age_81_90"
        elif 91 <= age <= 100:
            return "age_91_100"
        return None

    def prepare_data_for_prediction(self):
        """Prepare the citizen's data for prediction."""
        # Convert age to the corresponding factor
        age = self.calculate_age()
        if age is None:
            return None  # Age is required for prediction
        age_factor = self.map_age_to_factor(age)

        # Simulate other factors for prediction (you can adjust this as per actual data)
        factors_data = np.zeros(51)  # Assuming there are 51 factors, adjust accordingly
        if age_factor:
            factors_data[0] = 1  # Assuming age factors are placed in the first index

        # Example: Add other factors such as gender, health condition, lifestyle, etc.
        # Assuming you convert categorical fields into binary values (1 for present, 0 for absent)
        # Adjust these mappings as per your data
        if self.gender == "Male":
            factors_data[1] = 1  # Assume gender is mapped to index 1
        if self.lifestyle == "Sedentary":
            factors_data[2] = 1  # Example for lifestyle factor

        return factors_data.reshape(1, -1)  # Return a 2D array for model input

    def predict_diseases(self):
        """Predict diseases for this senior citizen."""
        # Load the trained model and label encoder
        model_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'health_disease_model.pkl')
        label_encoder_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'disease_label_encoder.pkl')

        with open(model_file, 'rb') as f:
            model = joblib.load(f)

        with open(label_encoder_file, 'rb') as f:
            mlb = pickle.load(f)

        # Prepare data for prediction
        input_data = self.prepare_data_for_prediction()
        if input_data is None:
            return []  # No age, hence no prediction possible

        # Predict diseases
        prediction = model.predict(input_data)
        predicted_diseases = mlb.inverse_transform(prediction)
        
        return predicted_diseases


class PredictedDisease(models.Model):
    citizen_id = models.AutoField(primary_key=True)
    disease_name = models.CharField(max_length=255)
    score = models.FloatField(default=1.0)
    prediction_rank = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'predicted_diseases'
        managed = False


class SeniorCitizenDiseaseView(models.Model):
    citizen_id = models.IntegerField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    health_condition = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    address = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    lifestyle = models.CharField(max_length=455)
    medication = models.CharField(max_length=455)
    checkups = models.CharField(max_length=355)
    disease_name = models.CharField(max_length=255, null=True)
    score = models.FloatField(default=1)
    prediction_rank = models.IntegerField(default=1)
    disease_prediction_date = models.DateTimeField(null=True)

    class Meta:
        managed = False  # This model is based on a view, not a table
        db_table = 'senior_citizen_disease_view'  # The name of the MySQL view

class Activity(models.Model):
    activity_id = models.AutoField(primary_key=True)
    activity_name = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    date = models.DateField()
    time = models.TimeField()
    location = models.CharField(max_length=255)
    created_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    creator_id = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'activity'
        managed = False

class Announcement(models.Model):
    announcement_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    date_posted = models.DateField()
    posted_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    poster_id = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'announcement'
        managed = False

class Profile(models.Model):
    profile_id = models.AutoField(primary_key=True)
    user_type = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    user_id = models.IntegerField()
    first_name = models.CharField(max_length=50, blank=True, null=True)
    last_name = models.CharField(max_length=50, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField(max_length=100, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'profile'
        managed = False

class SMSNotification(models.Model):
    sms_id = models.AutoField(primary_key=True)
    recipient_phone = models.CharField(max_length=15)
    message = models.TextField()
    sent_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    sender_id = models.IntegerField()
    sent_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=255)

    class Meta:
        db_table = 'smsnotification'
        managed = False


class WeeklySMSSent(models.Model):
    week = models.CharField(max_length=255)
    sms_sent_count = models.IntegerField()

    class Meta:
        db_table = 'weekly_sms_sent'
        managed = False 

class SummaryCounts(models.Model):
    profile_count = models.IntegerField()
    activity_count = models.IntegerField()
    healthworker_count = models.IntegerField()
    smsnotification_count = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'summary_counts'
        # Adding this to prevent Django from trying to use an 'id' field
        # or generate migrations for this model
        default_permissions = ()


class DataProfiling(models.Model):
    id = models.AutoField(primary_key=True)
    address = models.CharField(max_length=255)
    gender = models.CharField(max_length=6, choices=[('Male', 'Male'), ('Female', 'Female')])
    age = models.IntegerField()
    lifestyle_diet = models.BooleanField(default=False)
    lifestyle_exercise = models.BooleanField(default=False)
    lifestyle_others = models.CharField(max_length=255, blank=True, null=True)
    medical_history_past_illness = models.TextField(blank=True, null=True)
    medical_history_treatments = models.TextField(blank=True, null=True)
    medical_history_ongoing_medications = models.TextField(blank=True, null=True)
    medical_history_checkups = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'dataprofiling'
        managed = False

class PredictiveAnalytics(models.Model):
    analytics_id = models.AutoField(primary_key=True)
    description = models.TextField()
    results = models.TextField()
    created_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    creator_id = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'predictiveanalytics'
        managed = False

class Appointment(models.Model):
    appointment_id = models.AutoField(primary_key=True)
    senior_id = models.IntegerField()
    worker_id = models.IntegerField()
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(
        max_length=10,
        choices=[('Scheduled', 'Scheduled'), ('Completed', 'Completed'), ('Cancelled', 'Cancelled')],
        default='Scheduled'
    )
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'appointment'
        managed = False