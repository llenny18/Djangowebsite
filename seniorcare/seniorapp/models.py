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
    login_time = models.DateTimeField()  # login_time from user_logs
    logout_time = models.DateTimeField()  # logout_time from user_logs

    class Meta:
        db_table = 'user_activity_log'  # Referencing the view in the database
        managed = False  # Since it's a view, Django won't manage it (no migrations)


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
    security_code = models.IntegerField(max_length=20)

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
    security_code = models.IntegerField(max_length=20)

    class Meta:
        db_table = 'healthworker'
        managed = False

class SeniorCitizen(models.Model):
    citizen_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    health_condition = models.TextField()
    address = models.CharField(max_length=255)
    treatments = models.CharField(max_length=255)
    checkups = models.CharField(max_length=255)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'seniorcitizen'
        managed = False

    def __str__(self):
        return f"{self.first_name} {self.last_name} ({self.citizen_id})"

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
    treatments = models.CharField(max_length=355)
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