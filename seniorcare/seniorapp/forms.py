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



class SMSNotificationFormBulk(forms.ModelForm):
    class Meta:
        model = SMSNotification
        fields = ['message', 'sent_by', 'sender_id']  # Specify fields explicitly if needed

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Customize field widgets
        self.fields['message'].widget = forms.Textarea(attrs={
            'class': 'form-control',
            'rows': 4,
            'placeholder': 'Enter your message here...'
        })
        self.fields['sent_by'].widget = forms.Select(attrs={
            'class': 'form-control',
            'readonly': 'readonly'  # Makes this field read-only
        })
        self.fields['sender_id'].widget = forms.NumberInput(attrs={
            'class': 'form-control',
            'readonly': 'readonly'  # Make this field read-only
        })

        # Set default values if needed
        if 'sent_by' not in self.initial:
            self.initial['sent_by'] = 'Admin'  # Default value for sent_by

    def clean_sender_id(self):
        # Optionally add validation logic
        sender_id = self.cleaned_data.get('sender_id')
        if not sender_id:  # Example validation
            raise forms.ValidationError("Sender ID is required.")
        return sender_id

    def clean_message(self):
        message = self.cleaned_data.get('message')
        if not message:
            raise forms.ValidationError("Message cannot be empty.")
        return message
    
    
    
class PredictiveAnalyticsForm(forms.ModelForm):
    class Meta:
        model = PredictiveAnalytics
        fields = '__all__'


