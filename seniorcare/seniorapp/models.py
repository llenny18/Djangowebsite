from django.db import models

class Admin(models.Model):
    admin_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'Admin'
        managed = False

class HealthWorker(models.Model):
    worker_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=100, unique=True)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'HealthWorker'
        managed = False

class SeniorCitizen(models.Model):
    citizen_id = models.AutoField(primary_key=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    health_condition = models.TextField()
    address = models.CharField(max_length=255)
    phone = models.CharField(max_length=15, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'SeniorCitizen'
        managed = False

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
        db_table = 'Announcement'
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
        db_table = 'Profile'
        managed = False

class SMSNotification(models.Model):
    sms_id = models.AutoField(primary_key=True)
    recipient_phone = models.CharField(max_length=15)
    message = models.TextField()
    sent_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    sender_id = models.IntegerField()
    sent_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'SMSNotification'
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
        db_table = 'DataProfiling'
        managed = False

class PredictiveAnalytics(models.Model):
    analytics_id = models.AutoField(primary_key=True)
    description = models.TextField()
    results = models.TextField()
    created_by = models.CharField(max_length=15, choices=[('Admin', 'Admin'), ('HealthWorker', 'HealthWorker')])
    creator_id = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'PredictiveAnalytics'
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