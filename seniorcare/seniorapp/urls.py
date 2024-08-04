from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('index', views.home, name='index'),
    path('citizens', views.citizens, name='citizens'),
    path('announcements', views.announcements, name='announcements'),
    path('admins', views.admins, name='admins'),
    path('healthworkers', views.healthworkers, name='healthworkers'),
    path('activities', views.activities, name='activities'),
    path('smsnotifications', views.smsnotifications, name='smsnotifications'),
    
]
