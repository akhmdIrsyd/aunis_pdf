from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import kontrak,isi_kontrak

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
        fields = '__all__'

class isi_kontrakForm(forms.ModelForm):
    id_kontraks = forms.CharField(widget=forms.HiddenInput(), required=False)
    class Meta:
        model = isi_kontrak
        fields = ['id_kontraks','Code_Purchase', 'nama_barang','spesifikasi', 'tujuan', 'satuan', 'jumlah', 'harga', 'total']
