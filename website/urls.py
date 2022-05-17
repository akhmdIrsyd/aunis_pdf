from django.conf import settings
from django.urls import path, include

from django.contrib.auth.views import LoginView
from django.contrib.auth import views as auth_views

from . import views

urlpatterns = [
    path('', LoginView.as_view(template_name='login.html'), name='login'),
    path('login', LoginView.as_view(template_name='login.html'), name='login'),
    path('logout', auth_views.LogoutView.as_view(), name='logout'),
    path('', views.dashboard, name='dashboard'),
    path('dashboard', views.dashboard, name='dashboard'),
    path('list_pdf', views.list_pdf, name='list_pdf'),
    path('pdf_detail/<int:pk>/', views.pdf_detail, name='pdf_detail'),
    path('create_pdf', views.Create_pdf, name='create_pdf'),
    path('Update_pdf/<int:pk>', views.Update_pdf, name='Update_pdf'),
    path('Delete_pdf/<int:pk>', views.Delete_pdf, name='Delete_pdf'),
    path('create_isikontrak/<int:pk>/', views.Create_isikontrak, name='create_isikontrak'),
    path('Update_isikontrak/<int:pk>/', views.Update_isikontrak, name='Update_isikontrak'),
    path('Update_Update_status/<int:pk>/', views.Update_status, name='Update_Update_status'),
    path('Update_status/<int:pk>/', views.Update_status, name='Update_status'), #ini
    path('Delete_isikontrak/<int:pk>/', views.Delete_isikontrak, name='Delete_isikontrak'),
    path('list_perusahaan', views.list_perusahaan, name='list_perusahaan'),
    path('perusahaan_detail/<int:pk>/', views.perusahaan_detail, name='perusahaan_detail'),
    path('create_perusahaan', views.Create_perusahaan, name='create_perusahaan'),
    path('Update_perusahaan/<int:pk>/', views.Update_perusahaan, name='Update_perusahaan'),
    path('Delete_perusahaan/<int:pk>/', views.Delete_perusahaan, name='Delete_perusahaan'),
    #kwitansi
    path('list_kwitansi', views.list_kwitansi, name='list_kwitansi'),
    path('kwitansi_detail/<int:pk>/', views.kwitansi_detail, name='kwitansi_detail'),
    path('create_kwitansi', views.Create_kwitansi, name='create_kwitansi'),
    path('Update_kwitansi/<int:pk>/', views.Update_Kwitansi, name='Update_kwitansi'),
    path('Delete_kwitansi/<int:pk>/', views.Delete_kwitansi, name='Delete_kwitansi'),
    #isi_kwitansi
    path('Create_isi_Kwitansi/<int:pk>/', views.Create_isi_Kwitansi, name='Create_isi_Kwitansi'),
    path('Update_isi_Kwitansi/<int:pk>/', views.Update_isi_Kwitansi, name='Update_isi_Kwitansi'),
    path('Delete_isi_Kwitansi/<int:pk>/', views.Delete_isi_Kwitansi, name='Delete_isi_Kwitansi'),
    #Surat_jalan 
    path('list_SJalan/<int:pk>/', views.list_SJalan, name='list_SJalan'),
    path('detail_isiSJalan/<str:pk>/', views.detail_isiSJalan, name='detail_isiSJalan'),
    path('Create_sjalan/<int:pk>/', views.Create_SJalan, name='Create_sjalan'),
    path('Update_sjalan/<str:pk>/', views.Update_SJalan, name='Update_sjalan'),
    path('Delete_SJalan/<str:pk>/<str:uk>', views.Delete_SJalan, name='Delete_SJalan'),
    #isiSurat_jalan
    path('Create_isiSJalan/<int:pk>/', views.Create_isiSJalan, name='Create_isiSJalan'),
    path('Update_isiSJalan/<str:pk>/', views.Update_isiSJalan, name='Update_isiSJalan'),
    path('Delete_isiSJalan/<str:pk>/', views.Delete_isiSJalan, name='Delete_isiSJalan'),
     #Surat_jalan 
    path('Create_SuratJ/<int:pk>/', views.Create_SuratJ, name='Create_SuratJ'),
    path('Update_SuratJ/<int:pk>/<int:uk>', views.Update_SuratJ, name='Update_SuratJ'),
    path('detail_SuratJ/<int:pk>/<int:uk>', views.detail_SuratJ, name='detail_SuratJ'),
    path('change_pass', views.Ganti_password, name='change_pass'),
    #kontrak_manual
    path('Create_kontrakManual', views.Create_kontrakManual, name='Create_kontrakManual'),
]
