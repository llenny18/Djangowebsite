from django.shortcuts import render
from .models import SeniorCitizen, Announcement, Admin, HealthWorker

def home(request):
    
    return render(request, 'views/index.html')


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
