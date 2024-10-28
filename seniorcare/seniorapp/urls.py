from django.urls import path
from . import views

urlpatterns = [
    path('logout/', views.logout_view, name='logout'),
    path('login/', views.login_view, name='login'),
    path('', views.login_view, name='home'),
    path('index', views.home, name='index'),
    path('forgot_password/<int:admin_id>/', views.reset_password, name='reset_password'),
    path('forgot_password_h/<int:worker_id>/', views.reset_health_worker_password, name='forgot_password_h'),

    path('predictdis', views.predict_disease_list, name='predictdis'),
    path('admin_delete/<int:admin_id>/', views.delete_admin, name='delete_admin'),
    path('worker_delete/<int:worker_id>/', views.delete_worker, name='delete_worker'),
    path('citizens', views.citizens, name='citizens'),
    path('userlogs', views.userlogs, name='userlogs'),
    path('announcements', views.announcements, name='announcements'),
    path('admins', views.admins, name='admins'),
    path('admins/<int:id>/update/', views.admin_update, name='admin_update'),
    path('admins/create/', views.admin_create, name='admin_create'),
    
    path('health_worker/create/', views.health_worker_create, name='health_worker_create'),
    path('health_worker/update/<int:id>/', views.health_worker_update, name='health_worker_update'),
    
    path('senior_citizen/create/', views.senior_citizen_create, name='senior_citizen_create'),
    path('senior_citizen/update/<int:id>/', views.senior_citizen_update, name='senior_citizen_update'),
    
    path('analytic_reports', views.analytic_reports, name='analytic_reports'),
    path('profile_reports', views.profile_reports, name='profile_reports'),
    
    path('activity/create/', views.activity_create, name='activity_create'),
    path('activity/update/<int:id>/', views.activity_update, name='activity_update'),
    
    path('announcement/create/', views.announcement_create, name='announcement_create'),
    path('announcement/update/<int:id>/', views.announcement_update, name='announcement_update'),
    
    path('profile/create/', views.profile_create, name='profile_create'),
    path('profile/update/<int:id>/', views.profile_update, name='profile_update'),
    
    path('sms_notification/create/', views.sms_notification_create, name='sms_notification_create'),
    path('sms_notification/create_bulk/', views.sms_notification_create_bulk, name='sms_notification_create_bulk'),
    path('sms_notification/update/<int:id>/', views.sms_notification_update, name='sms_notification_update'),
    

    path('data_profiling/', views.data_profiling_list, name='data_profiling'),
    path('data_profiling/create/', views.data_profiling_create, name='data_profiling_create'),
    path('data_profiling/update/<int:id>/', views.data_profiling_update, name='data_profiling_update'),
   

    path('predictive_analytics/create/', views.predictive_analytics_create, name='predictive_analytics_create'),
    path('predictive_analytics/update/<int:id>/', views.predictive_analytics_update, name='predictive_analytics_update'),

    path('healthworkers', views.healthworkers, name='healthworkers'),
    path('activities', views.activities, name='activities'),
    path('smsnotifications', views.smsnotifications, name='smsnotifications'),

    path('appointments', views.appointments, name='appointments'),
    path('appointment/create/', views.appointment_create, name='appointment_create'),
    path('appointment/update/<int:id>/', views.appointment_update, name='appointment_update'),
]
