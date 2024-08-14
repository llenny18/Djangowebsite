from django.urls import path
from . import views

urlpatterns = [
     path('login/', views.login_view, name='login'),
    path('', views.home, name='home'),
    path('index', views.home, name='index'),



    path('citizens', views.citizens, name='citizens'),
    path('announcements', views.announcements, name='announcements'),
    path('admins', views.admins, name='admins'),
    path('admins/<int:id>/update/', views.admin_update, name='admin_update'),
    path('admins/create/', views.admin_create, name='admin_create'),
    
    path('health_worker/create/', views.health_worker_create, name='health_worker_create'),
    path('health_worker/update/<int:id>/', views.health_worker_update, name='health_worker_update'),
    
    path('senior_citizen/create/', views.senior_citizen_create, name='senior_citizen_create'),
    path('senior_citizen/update/<int:id>/', views.senior_citizen_update, name='senior_citizen_update'),
    
    path('activity/create/', views.activity_create, name='activity_create'),
    path('activity/update/<int:id>/', views.activity_update, name='activity_update'),
    
    path('announcement/create/', views.announcement_create, name='announcement_create'),
    path('announcement/update/<int:id>/', views.announcement_update, name='announcement_update'),
    
    path('profile/create/', views.profile_create, name='profile_create'),
    path('profile/update/<int:id>/', views.profile_update, name='profile_update'),
    
    path('sms_notification/create/', views.sms_notification_create, name='sms_notification_create'),
    path('sms_notification/update/<int:id>/', views.sms_notification_update, name='sms_notification_update'),
    
    path('predictive_analytics/create/', views.predictive_analytics_create, name='predictive_analytics_create'),
    path('predictive_analytics/update/<int:id>/', views.predictive_analytics_update, name='predictive_analytics_update'),

    path('healthworkers', views.healthworkers, name='healthworkers'),
    path('activities', views.activities, name='activities'),
    path('smsnotifications', views.smsnotifications, name='smsnotifications'),
    
]
