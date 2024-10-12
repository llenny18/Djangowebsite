from django import forms
from .models import Admin, HealthWorker, SeniorCitizen, Activity, Announcement, Profile, SMSNotification, PredictiveAnalytics, Appointment, DataProfiling

class DataProfilingForm(forms.ModelForm):
    class Meta:
        model = DataProfiling
        fields = '__all__'


class LoginForm(forms.Form):
    username = forms.CharField(
        max_length=50, 
        required=True,  
        widget=forms.TextInput(attrs={'class': 'form-control form-control-lg'})
    )
    password = forms.CharField(
        max_length=255, 
        required=True,  
        widget=forms.PasswordInput(attrs={
            'class': 'form-control form-control-lg', 
            'id': 'password'  # Add an ID to target it in the template
        })
    )

class AppointmentForm(forms.ModelForm):
    class Meta:
        model = Appointment
        fields = ['senior_id', 'worker_id', 'date', 'time', 'status']

class AdminForm(forms.ModelForm):
    class Meta:
        model = Admin
        fields = '__all__'

from django import forms

class ResetPasswordForm(forms.Form):
    security_code = forms.CharField(
        label='Security Code', 
        max_length=50, 
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    new_password = forms.CharField(
        label='New Password', 
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )
    confirm_password = forms.CharField(
        label='Re-Type New Password', 
        widget=forms.TextInput(attrs={'class': 'form-control'})
    )

    def clean(self):
        cleaned_data = super().clean()
        new_password = cleaned_data.get("new_password")
        confirm_password = cleaned_data.get("confirm_password")

        if new_password != confirm_password:
            raise forms.ValidationError("Passwords do not match.")
        return cleaned_data


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
        exclude = ['created_by', 'creator_id']

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


