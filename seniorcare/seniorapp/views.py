from django.shortcuts import render
from .models import  Activity, SeniorCitizen, Announcement, Admin, HealthWorker, SMSNotification

def home(request):
    
    return render(request, 'views/index.html')


def activities(request):
    activities = Activity.objects.all()
    return render(request, 'views/activities.html', {'activities': activities})

def citizens(request):
    seniors = SeniorCitizen.objects.all()
    return render(request, 'views/citizens.html', {'seniors': seniors})

def announcements(request):
    Announcements = Announcement.objects.all()
    return render(request, 'views/announcements.html', {'announcements': Announcements})

def admins(request):
    Admins = Admin.objects.all()
    return render(request, 'views/admins.html', {'admins': Admins})

def healthworkers(request):
    HealthWorkers = HealthWorker.objects.all()
    return render(request, 'views/healthworkers.html', {'healthworkers': HealthWorkers})


def smsnotifications(request):
    smsnotifications = SMSNotification.objects.all()
    return render(request, 'views/smsnotifications.html', {'smsnotifications': smsnotifications})

