from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import kontrak, isi_kontrak, perusahaan, kwitansi, isi_kwitansi

class Ganti_passForm(forms.ModelForm):
    new_password = forms.CharField(
        max_length=500, required=False, label="Password Baru")

    class Meta:
        model = User
        fields = ['new_password']
        labels = {
            "new_password": "Password Baru",
        }


class KontrakForm(forms.ModelForm):
    class Meta:
        model = kontrak
        fields = ['file_pdf']
        #fields = '__all__'
    

class PerusahaanForm(forms.ModelForm):
    class Meta:
        model = perusahaan
        fields = '__all__'

class isi_kontrakForm(forms.ModelForm):
    id_kontraks = forms.CharField(widget=forms.HiddenInput(), required=False)
    class Meta:
        model = isi_kontrak
        fields = ['id_kontraks','Code_Purchase','id_perusahaan', 'nama_barang','spesifikasi', 'satuan', 'jumlah', 'harga', 'total','no_kontrak', 'supplier', 'tgl_order', 'waktu', 'tgl_penyerahan','status']


class KwitansiForm(forms.ModelForm):
    class Meta:
        model = kwitansi
        fields = '__all__'

class isi_KwitansiForm(forms.ModelForm):
    class Meta:
        model = isi_kwitansi
        fields = ['nama_barang','spesifikasi','satuan','jumlah','harga']
