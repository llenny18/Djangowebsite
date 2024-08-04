from django.shortcuts import render, get_object_or_404, redirect
from .models import Admin, HealthWorker, SeniorCitizen, Activity, Announcement, Profile, SMSNotification, PredictiveAnalytics
from .forms import AdminForm, HealthWorkerForm, SeniorCitizenForm, ActivityForm, AnnouncementForm, ProfileForm, SMSNotificationForm, PredictiveAnalyticsForm


# HealthWorker update
def health_worker_update(request, id):
    health_worker = get_object_or_404(HealthWorker, worker_id=id)
    if request.method == 'POST':
        form = HealthWorkerForm(request.POST, instance=health_worker)
        if form.is_valid():
            form.save()
            return redirect('health_workers')
    else:
        form = HealthWorkerForm(instance=health_worker)
    return render(request, 'views/health_worker_update.html', {'form': form, 'health_worker': health_worker})

# HealthWorker create
def health_worker_create(request):
    if request.method == 'POST':
        form = HealthWorkerForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('health_workers')
    else:
        form = HealthWorkerForm()
    return render(request, 'views/health_worker_create.html', {'form': form})

# SeniorCitizen update
def senior_citizen_update(request, id):
    senior_citizen = get_object_or_404(SeniorCitizen, citizen_id=id)
    if request.method == 'POST':
        form = SeniorCitizenForm(request.POST, instance=senior_citizen)
        if form.is_valid():
            form.save()
            return redirect('senior_citizens')
    else:
        form = SeniorCitizenForm(instance=senior_citizen)
    return render(request, 'views/senior_citizen_update.html', {'form': form, 'senior_citizen': senior_citizen})

# SeniorCitizen create
def senior_citizen_create(request):
    if request.method == 'POST':
        form = SeniorCitizenForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('senior_citizens')
    else:
        form = SeniorCitizenForm() 
    return render(request, 'views/senior_citizen_create.html', {'form': form})

# Activity update
def activity_update(request, id):
    activity = get_object_or_404(Activity, activity_id=id)
    if request.method == 'POST':
        form = ActivityForm(request.POST, instance=activity)
        if form.is_valid():
            form.save()
            return redirect('activities')
    else:
        form = ActivityForm(instance=activity)
    return render(request, 'views/activity_update.html', {'form': form, 'activity': activity})

# Activity create
def activity_create(request):
    if request.method == 'POST':
        form = ActivityForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('activities')
    else:
        form = ActivityForm()
    return render(request, 'views/activity_create.html', {'form': form})

# Announcement update
def announcement_update(request, id):
    announcement = get_object_or_404(Announcement, announcement_id=id)
    if request.method == 'POST':
        form = AnnouncementForm(request.POST, instance=announcement)
        if form.is_valid():
            form.save()
            return redirect('announcements')
    else:
        form = AnnouncementForm(instance=announcement)
    return render(request, 'views/announcement_update.html', {'form': form, 'announcement': announcement})

# Announcement create
def announcement_create(request):
    if request.method == 'POST':
        form = AnnouncementForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('announcements')
    else:
        form = AnnouncementForm()
    return render(request, 'views/announcement_create.html', {'form': form})

# Profile update
def profile_update(request, id):
    profile = get_object_or_404(Profile, profile_id=id)
    if request.method == 'POST':
        form = ProfileForm(request.POST, instance=profile)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    else:
        form = ProfileForm(instance=profile)
    return render(request, 'views/profile_update.html', {'form': form, 'profile': profile})

# Profile create
def profile_create(request):
    if request.method == 'POST':
        form = ProfileForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('profiles')
    else:
        form = ProfileForm()
    return render(request, 'views/profile_create.html', {'form': form})

# SMSNotification update
def sms_notification_update(request, id):
    sms_notification = get_object_or_404(SMSNotification, sms_id=id)
    if request.method == 'POST':
        form = SMSNotificationForm(request.POST, instance=sms_notification)
        if form.is_valid():
            form.save()
            return redirect('sms_notifications')
    else:
        form = SMSNotificationForm(instance=sms_notification)
    return render(request, 'views/sms_notification_update.html', {'form': form, 'sms_notification': sms_notification})

# SMSNotification create
def sms_notification_create(request):
    if request.method == 'POST':
        form = SMSNotificationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('sms_notifications')
    else:
        form = SMSNotificationForm()
    return render(request, 'views/sms_notification_create.html', {'form': form})

# PredictiveAnalytics update
def predictive_analytics_update(request, id):
    predictive_analytics = get_object_or_404(PredictiveAnalytics, analytics_id=id)
    if request.method == 'POST':
        form = PredictiveAnalyticsForm(request.POST, instance=predictive_analytics)
        if form.is_valid():
            form.save()
            return redirect('predictive_analytics')
    else:
        form = PredictiveAnalyticsForm(instance=predictive_analytics)
    return render(request, 'views/predictive_analytics_update.html', {'form': form, 'predictive_analytics': predictive_analytics})

# PredictiveAnalytics create
def predictive_analytics_create(request):
    if request.method == 'POST':
        form = PredictiveAnalyticsForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('predictive_analytics')
    else:
        form = PredictiveAnalyticsForm()
    return render(request, 'views/predictive_analytics_create.html', {'form': form})


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