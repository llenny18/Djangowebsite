from django import forms
from .models import Admin, HealthWorker, SeniorCitizen, Activity, Announcement, Profile, SMSNotification, PredictiveAnalytics

class AdminForm(forms.ModelForm):
    class Meta:
        model = Admin
        fields = '__all__'

class HealthWorkerForm(forms.ModelForm):
    class Meta:
        model = HealthWorker
        fields = '__all__'

class SeniorCitizenForm(forms.ModelForm):
    class Meta:
        model = SeniorCitizen
        fields = '__all__'

class ActivityForm(forms.ModelForm):
    class Meta:
        model = Activity
        fields = '__all__'

class AnnouncementForm(forms.ModelForm):
    class Meta:
        model = Announcement
        fields = '__all__'

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = '__all__'

class SMSNotificationForm(forms.ModelForm):
    class Meta:
        model = SMSNotification
        fields = '__all__'

class PredictiveAnalyticsForm(forms.ModelForm):
    class Meta:
        model = PredictiveAnalytics
        fields = '__all__'
