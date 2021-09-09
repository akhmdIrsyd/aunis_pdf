from django.conf import settings
from django.urls import path, include

from django.contrib.auth.views import LoginView
from django.contrib.auth import views as auth_views

from . import views

urlpatterns = [
    path('login', LoginView.as_view(template_name='website/form.html'), name='login'),
    path('logout', auth_views.LogoutView.as_view(), name='logout'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('list_kontrak', views.list_kontrak, name='list_kontrak'),
    path('kontrak_detail/<int:pk>/', views.kontrak_detail, name='kontrak_detail'),
    path('create_kontrak', views.Create_kontrak, name='create_kontrak'),
    path('Update_kontrak/<int:pk>/', views.Update_kontrak, name='Update_kontrak'),
    path('Delete_kontrak/<int:pk>/', views.Delete_kontrak, name='Delete_kontrak'),
    path('create_isikontrak/<int:pk>/', views.Create_isikontrak, name='create_isikontrak'),
    path('Update_isikontrak/<int:pk>/', views.Update_isikontrak, name='Update_isikontrak'),
    path('Delete_isikontrak/<int:pk>/', views.Delete_isikontrak, name='Delete_isikontrak'),
    path('change_pass', views.Ganti_password, name='change_pass'),
]
