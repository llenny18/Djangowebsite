from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from seniorapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('seniorapp.urls')),
]
if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)