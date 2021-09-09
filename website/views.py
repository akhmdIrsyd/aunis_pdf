from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from .models import kontrak,isi_kontrak
from .forms import Ganti_passForm, KontrakForm, isi_kontrakForm

from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.hashers import make_password
# Create your views here.
import tabula
import pandas as pd
import numpy as np
import os
from django.conf import settings

def replace(string: str) -> str:
    if '\r' in string:
        rv = ''
        for word in string.split():
            rv += ' value' if '\r' in word else ' ' + word
        return rv.strip()
    else:
        return string


def read_pdf(files_pdf):
    file = os.path.join(settings.MEDIA_ROOT, files_pdf)
    table = tabula.read_pdf(file,multiple_tables=False,pages='all', pandas_options={'header': None}, guess=False, lattice=True)
    df=table[0]
    df_total = df[-5:].reset_index(drop=True)
    if (len(df.columns)==7):
        df_total = df_total[[0, 1]]
        df['new_col_name']=df.index.map(str)
        df['new_col_name2']='-'
        df=df[['new_col_name','new_col_name2',0,1,2,3,4,5,6]]
    elif (len(df.columns)==8):
        df_total = df_total[[0, 1]]
        df['new_col_name']='-'
        df=df[[0,1,2,3,'new_col_name',4,5,6,7]]

    df.columns = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    df_data = df[1:-5].reset_index(drop=True)
    f1 = lambda x: ' '.join(x.dropna())
    c =[0,1,2,3,4,5,6,7]
    d1 = dict.fromkeys(c, f1)
    d2 = dict.fromkeys(df_data.columns.difference(c), 'first')
    f = {**d1, **d2}
    df_data=df_data.groupby(df_data[0].ffill()).agg(f).reset_index(drop=True)

    df_data[1] = df_data[1].apply(replace)
    df_data[2] = df_data[2].apply(replace)
    df_data[3] = df_data[3].apply(replace)
    df_data[0] = df_data[0].astype(int)
    df_data = df_data.sort_values(0)
    return df_data, df_total

@login_required(login_url='login')
def Ganti_password(request):
    user = request.user
    mail = user.email
    data_akuns = User.objects.get(id=user.id)
    if request.method == 'POST':
        form = Ganti_passForm(request.POST, instance=data_akuns)

        if form.is_valid():
            password = form.cleaned_data.get('new_password')
            if password is None:
                password = user.password
            else:
                password = password
            data_akuns.password = make_password(password)
            form.save()
            return redirect('dashboard')
    else:
        form = Ganti_passForm(instance=data_akuns)
    context = {
        'rows': data_akuns,
        'mail': mail,
        'form': form,
    }
    return render(request, 'website/form.html', context)


@login_required(login_url='login')
def dashboard(request):
    # Data_siswa = data_siswa.objects.all()
    context = {
        # 'rows': Data_siswa,
    }
    return render(request, 'website/dashboard.html', context)

#list Pengumuman
@login_required(login_url='login')
def list_kontrak(request):
    Data_kontrak = kontrak.objects.order_by("-tanggal")
    context = {
        'rows': Data_kontrak,
    }
    return render(request, 'website/dashboard.html', context)

#detail Pengumuman
@login_required(login_url='login')
def kontrak_detail(request, pk):
    Data_kontraks = kontrak.objects.get(id=pk)
    Data_isikontraks = isi_kontrak.objects.get(id_kontrak=Data_kontraks.id)
    context = {
        'rows': Data_kontraks,
        'rows2': Data_isikontraks,
    }
    return render(request, 'website/dashboard.html', context)


@login_required(login_url='login')
def Create_kontrak(request):
    user = request.user
    mail = user.email
    if request.method == 'POST':
        form = KontrakForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            kode_kontrak = form.cleaned_data.get('kode')
            Data_kontraks = kontrak.objects.get(kode=kode_kontrak)

            files_pdf = Data_kontraks.file_pdf
            files_pdf = str(files_pdf)
            #files_pdf = ','.join(Data_kontraks)
            df_data,df_total=read_pdf(files_pdf)
            
            
            for i in range(len(df_data)):
                isi_kontraks = isi_kontrak()
                isi_kontraks.id_kontrak = Data_kontraks
                isi_kontraks.Code_Purchase = df_data[1][i]
                isi_kontraks.nama_barang = df_data[2][i]
                isi_kontraks.spesifikasi = df_data[3][i]
                isi_kontraks.tujuan = df_data[4][i]
                isi_kontraks.satuan = df_data[5][i]
                isi_kontraks.jumlah = df_data[6][i]
                isi_kontraks.harga = df_data[6][i]
                isi_kontraks.total = df_data[7][i]
                isi_kontraks.save()
            return redirect('dashboard')
    else:
        form = KontrakForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'website/form.html', context)


@login_required(login_url='login')
def Update_kontrak(request, pk):
    user = request.user
    mail = user.email
    data_kontraks = kontrak.objects.get(id=pk)
    if request.method == 'POST':
        form = KontrakForm(request.POST, request.FILES, instance=data_kontraks)
        if form.is_valid():
            form.save()
            kode_kontrak = form.cleaned_data.get('kode')
            Data_kontraks = kontrak.objects.get(kode=kode_kontrak)

            delisi_kontraks = isi_kontrak.objects.get(id_kontrak=Data_kontraks.id)
            delisi_kontraks.delete()

            files_pdf = Data_kontraks.file_pdf
            files_pdf = str(files_pdf)
            #files_pdf = ','.join(Data_kontraks)
            df_data, df_total = read_pdf(files_pdf)

            for i in range(len(df_data)):
                isi_kontraks = isi_kontrak()
                isi_kontraks.id_kontrak = Data_kontraks
                isi_kontraks.Code_Purchase = df_data[1][i]
                isi_kontraks.nama_barang = df_data[2][i]
                isi_kontraks.spesifikasi = df_data[3][i]
                isi_kontraks.tujuan = df_data[4][i]
                isi_kontraks.satuan = df_data[5][i]
                isi_kontraks.jumlah = df_data[6][i]
                isi_kontraks.harga = df_data[6][i]
                isi_kontraks.total = df_data[7][i]
                isi_kontraks.save()
            return redirect('dashboard')
    else:
        form = KontrakForm(instance=data_kontraks)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_kontraks
    }
    return render(request, 'website/form.html', context)


@login_required(login_url='login')
def Delete_kontrak(request, pk):
    data_kontraks = kontrak.objects.get(id=pk)
    data_kontraks.delete()
    return redirect('dashboard')


#ISI KONTRAK
#tambah kontrak
@login_required(login_url='login')
def Create_isikontrak(request,pk):
    user = request.user
    mail = user.email
    data_kontraks = kontrak.objects.get(id=pk)
    if request.method == 'POST':
        form = isi_kontrakForm(request.POST)
        if form.is_valid():
            #form = form.save(commit=False)
            isi_kontraks=isi_kontrak()
            isi_kontraks.id_kontrak = data_kontraks
            isi_kontraks.Code_Purchase = form.cleaned_data.get('Code_Purchase')
            isi_kontraks.nama_barang = form.cleaned_data.get('nama_barang')
            isi_kontraks.spesifikasi = form.cleaned_data.get('spesifikasi')
            isi_kontraks.tujuan = form.cleaned_data.get('tujuan')
            isi_kontraks.satuan = form.cleaned_data.get('satuan')
            isi_kontraks.jumlah = form.cleaned_data.get('jumlah')
            isi_kontraks.harga = form.cleaned_data.get('harga')
            isi_kontraks.total = form.cleaned_data.get('total')
            
            isi_kontraks.save()
            
            return redirect('dashboard')
    else:
        form = isi_kontrakForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'website/form.html', context)


@login_required(login_url='login')
def Update_isikontrak(request, pk):
    user = request.user
    mail = user.email
    data_isikontraks = isi_kontrak.objects.get(id=pk)
    if request.method == 'POST':
        form = isi_kontrakForm(request.POST, instance=data_isikontraks)
        if form.is_valid():
            form.save()
           
            return redirect('dashboard')
    else:
        form = isi_kontrakForm(instance=data_isikontraks)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_isikontraks
    }
    return render(request, 'website/form.html', context)


@login_required(login_url='login')
def Delete_isikontrak(request, pk):
    data_isikontraks = isi_kontrak().objects.get(id=pk)
    data_isikontraks.delete()
    return redirect('dashboard')
