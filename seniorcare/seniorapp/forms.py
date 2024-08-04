from django import forms
from .models import Admin

class AdminForm(forms.ModelForm):
    class Meta:
        model = Admin
        fields = ['username', 'password', 'email', 'phone']  # Include fields you want to display and update
