from django.shortcuts import render, get_object_or_404, redirect
from .models import  Activity, SeniorCitizen, Announcement, Admin, HealthWorker, SMSNotification
from .forms import AdminForm

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



def editadmin(request):
    editadmin = SMSNotification.objects.all()
    return render(request, 'views/edit.html', {'editadmin': editadmin})


def admin_update(request, id):
    admin = get_object_or_404(Admin, admin_id=id)
    if request.method == 'POST':
        form = AdminForm(request.POST, instance=admin)
        if form.is_valid():
            form.save()
            return redirect('admins')
    else:
        form = AdminForm(instance=admin)
    return render(request, 'views/admin_update.html', {'form': form, 'admin': admin})


def admin_create(request):
    if request.method == 'POST':
        form = AdminForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admins')
    else:
        form = AdminForm()
    return render(request, 'views/admin_create.html', {'form': form})