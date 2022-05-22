from django.http.response import HttpResponseRedirect
from django.shortcuts import render, redirect, HttpResponse
from django.contrib.auth.models import User
from .models import kontrak, isi_kontrak, perusahaan, isi_kwitansi, kwitansi, SJalan, isi_SJalan, SuratJ
from .forms import Ganti_passForm, KontrakForm, isi_kontrakForm, PerusahaanForm, isi_KwitansiForm, KwitansiForm, SJalanForm, Isi_SJalanForm, SuratJForm
from django.db.models import Count

from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.hashers import make_password
import uuid
# Create your views here.
import tabula
import pandas as pd
import numpy as np
import datetime
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
        #df[7] = '-'
        df_total=df[-5:].reset_index(drop=True)
        df_total = df_total[[0, 1]]
        df['no']=df.index.map(str)
        df['code']='-'
        df['perusahaan']='-'
        df['nokontrak']='-'
        df['suplier']='-'
        df['tglorder']='-'
        df['waktu']='-'
        df['tglpenyerahan']='-'
        df=df[['no','code','perusahaan',0,1,3,4,5,6,'nokontrak','suplier','tglorder','waktu','tglpenyerahan']]
        df_data=df[1:-5].reset_index(drop=True)
    elif (len(df.columns)==8):
        df_total=df[-5:].reset_index(drop=True)
        df_total = df_total[[0, 1]]
        df['new_col_name']='-'
        df['perusahaan']='-'
        df['nokontrak']='-'
        df['suplier']='-'
        df['tglorder']='-'
        df['waktu']='-'
        df['tglpenyerahan']='-'
        df=df[[0,1,'perusahaan',2,3,4,5,6,7,'nokontrak','suplier','tglorder','waktu','tglpenyerahan']]

        #df_data=df.drop_duplicates(subset=[0])
        df_data=df[1:-5].reset_index(drop=True)
        #df_data[0] = df_data[0].astype(int)
    elif (len(df.columns)==14):
        df_total=df[-3:].reset_index(drop=True)
        df_total = df_total[[0, 1]]

       # df_data=df.drop_duplicates(subset=[3])
        df_data=df[1:-3].reset_index(drop=True)

    df_data.columns = [0, 1, 2, 3, 4, 5, 6, 7,8,9,10,11,12,13]
    df_data = df_data[~df_data[0].str.contains("NO.")]
    f1 = lambda x: ' '.join(x.dropna())
    c = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
    d1 = dict.fromkeys(c, f1)
    d2 = dict.fromkeys(df_data.columns.difference(c), 'first')
    f = {**d1, **d2}
    df_data=df_data.groupby(df_data[0].ffill()).agg(f).reset_index(drop=True)

    df_data[3]=df_data[3].apply(replace)
    df_data[4]=df_data[4].apply(replace)
    df_data[5]=df_data[5].apply(replace)
    df_data[9]=df_data[9].apply(replace)
    df_data[10]=df_data[10].apply(replace)
    df_data[0] = df_data[0].astype(int)
    if df_data[12].all() == '-' :
        df_data[12]=45
    if df_data[11].all() == '-' or df_data[11].all() == '--':
        df_data[11]=datetime.date.today()- datetime.timedelta(days=45)
        df_data[13]=datetime.date.today()

    df_data[11] = df_data[11].astype('datetime64').dt.strftime('%m/%d/%y')
    df_data[13] = df_data[13].astype('datetime64').dt.strftime('%m/%d/%y')
    df_data[11] = pd.to_datetime(df_data[11]).dt.strftime('%Y-%m-%d')
    df_data[13] = pd.to_datetime(df_data[13]).dt.strftime('%Y-%m-%d')
    df_data[6] = df_data[6].str.replace(r'[a-zA-Z \n\,\.]','').astype(int)
    df_data[7] = df_data[7].str.replace(r'[a-zA-Z \n\,\.]','').astype(int)
    df_data[8] = df_data[8].str.replace(r'[a-zA-Z \n\,\.]','').astype(int)
    if df_data[2].all() == '-' or df_data[9].all() == '-' or df_data[10].all() == '-':
        tables = tabula.read_pdf(file,multiple_tables=False,pages=1, pandas_options={'header': None}, guess=False, lattice=False)
        dfs = tables[0]
        dfs = dfs.dropna(axis='columns')
        dfs = dfs[dfs[1].str.contains("Nomor Kontrak")]
        dfs=dfs[1].str.replace('Nomor Kontrak合同号:','').reset_index(drop=True)
        dfs = dfs[0]
        df_data[9]=dfs
        df_data[2]=dfs[:4]
        df_data[10] = "AUNIS PRINT OFFSET"
    df_data=df_data.sort_values(0)

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
    return render(request, 'form.html', context)


@login_required(login_url='login')
def dashboard(request):
    tot_kontrak = kontrak.objects.count()
    tot_perusahaan = perusahaan.objects.count()
    tot_suratjalan = SJalan.objects.count()
    tot_kwitansi = kwitansi.objects.count()
    context = {
        'tot_kontrak' : tot_kontrak,
        'tot_perusahaan' : tot_perusahaan,
        'tot_suratjalan' : tot_suratjalan,
        'tot_kwitansi' : tot_kwitansi
    }
    return render(request, 'dashboard.html', context)


#list Pengumuman
@login_required(login_url='login')
def list_pdf(request):
    Data_kontrak = kontrak.objects.order_by("-date_upload")
    context = {
        'rows': Data_kontrak,
    }
    return render(request, 'list_kontrak.html', context)


#detail Pengumuman
@login_required(login_url='login')
def pdf_detail(request, pk):
    #Data_kontraks = kontrak.objects.get(id=pk)
    Data_kontrak = kontrak.objects.filter(id=pk)[0]

    Data_isikontraks = isi_kontrak.objects.filter(id_kontrak=pk)
    Data_isikontraks.update(status=False)
    
    list_of_id_for_action = None
    list_of_obj = []
    data_selected = []
    
    if request.method == 'POST':
        list_of_id_for_action = request.POST.getlist('items')
        list_of_obj = isi_kontrak.objects.filter(pk__in=list_of_id_for_action)
        list_of_obj.update(status=True)
        data_selected = list(list_of_obj.values_list('id', flat=True))

    print(list_of_id_for_action)
    context = {
        'rows': Data_isikontraks,
        'doc': Data_kontrak,
        'print': data_selected
    }
    # return render(request, 'test.html', context)
    return render(request, 'detail_kontrak.html', context)


@login_required(login_url='login')
def Create_pdf(request):
    user = request.user
    mail = user.email
    kode = str(uuid.uuid4())
    if request.method == 'POST':
        form = KontrakForm(request.POST, request.FILES)
        if form.is_valid():
            pdf=kontrak()
            pdf.file_pdf = form.cleaned_data.get('file_pdf')

            pdf.kode = kode
            pdf.save()

            #kode_kontrak = form.cleaned_data.get('kode')
            Data_kontraks = kontrak.objects.get(kode=kode)

            files_pdf = Data_kontraks.file_pdf
            files_pdf = str(files_pdf)
            #files_pdf = ','.join(Data_kontraks)
            df_data,df_total=read_pdf(files_pdf)


            for i in range(len(df_data)):
                isi_kontraks = isi_kontrak()
                isi_kontraks.id_kontrak = Data_kontraks
                isi_kontraks.Code_Purchase = df_data[1][i]
                isi_kontraks.no_kontrak = df_data[9][i]
                isi_kontraks.nama_barang = df_data[3][i]
                isi_kontraks.spesifikasi = df_data[4][i]
                isi_kontraks.satuan = df_data[5][i]
                isi_kontraks.jumlah = df_data[6][i]
                isi_kontraks.harga = df_data[7][i]
                isi_kontraks.total = df_data[8][i]
                Data_perusahaan = perusahaan.objects.get(kode_perusahaan=df_data[2][i])
                isi_kontraks.id_perusahaan = Data_perusahaan
                isi_kontraks.supplier = df_data[10][i]
                isi_kontraks.tgl_order = df_data[11][i]
                isi_kontraks.waktu = df_data[12][i]
                isi_kontraks.tgl_penyerahan = df_data[13][i]
                isi_kontraks.save()
            return redirect('list_pdf')
    else:
        form = KontrakForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Update_pdf(request, pk):
    user = request.user
    mail = user.email
    code = str(uuid.uuid4())
    data_kontraks = kontrak.objects.get(id=pk)

    if request.method == 'POST':
        form = KontrakForm(request.POST, request.FILES, instance=data_kontraks)
        if form.is_valid():
            isi_kontrak.objects.filter(id_kontrak=pk).delete()
            form.save(commit=False)


            #form.file_pdf = form.cleaned_data.get('file_pdf')

            #form.kode = code
            form.save()
            #kode_pdf = form.cleaned_data.get('kode')
            Data_pdf = kontrak.objects.get(id=pk)

            #delisi_kontraks = isi_kontrak.objects.get(id_kontrak=Data_kontraks.id)
            #delisi_kontraks.delete()

            files_pdf = Data_pdf.file_pdf
            files_pdf = str(files_pdf)
            #files_pdf = ','.join(Data_kontraks)
            df_data, df_total = read_pdf(files_pdf)

            for i in range(len(df_data)):
                isi_kontraks=isi_kontrak()
                isi_kontraks.id_kontrak = Data_pdf
                isi_kontraks.Code_Purchase = df_data[1][i]
                isi_kontraks.no_kontrak = df_data[9][i]
                isi_kontraks.nama_barang = df_data[3][i]
                isi_kontraks.spesifikasi = df_data[4][i]
                isi_kontraks.satuan = df_data[5][i]
                isi_kontraks.jumlah = df_data[6][i]
                isi_kontraks.harga = df_data[7][i]
                isi_kontraks.total = df_data[8][i]
                Data_perusahaan = perusahaan.objects.get(kode_perusahaan=df_data[2][i])
                isi_kontraks.id_perusahaan = Data_perusahaan
                isi_kontraks.supplier = df_data[10][i]
                isi_kontraks.tgl_order = df_data[11][i]
                isi_kontraks.waktu = df_data[12][i]
                isi_kontraks.tgl_penyerahan = df_data[13][i]
                isi_kontraks.save()
            return redirect('list_pdf')
    else:
        form = KontrakForm(instance=data_kontraks)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_kontraks
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Delete_pdf(request, pk):
    data_kontraks = kontrak.objects.get(id=pk)
    data_kontraks.delete()
    return redirect('list_pdf')


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
            isi_kontraks.satuan = form.cleaned_data.get('satuan')
            isi_kontraks.jumlah = form.cleaned_data.get('jumlah')
            isi_kontraks.harga = form.cleaned_data.get('harga')
            isi_kontraks.total = form.cleaned_data.get('total')
            isi_kontraks.id_perusahaan = form.cleaned_data.get('id_perusahaan')
            isi_kontraks.supplier = form.cleaned_data.get('supplier')
            isi_kontraks.tgl_order = form.cleaned_data.get('tgl_order')
            isi_kontraks.waktu = form.cleaned_data.get('waktu')
            isi_kontraks.tgl_penyerahan = form.cleaned_data.get('tgl_penyerahan')
            isi_kontraks.status = form.cleaned_data.get('status')

            isi_kontraks.save()

            return redirect('list_pdf')
    else:
        form = isi_kontrakForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Update_isikontrak(request, pk):
    user = request.user
    mail = user.email
    data_isikontraks = isi_kontrak.objects.get(id=pk)
    if request.method == 'POST':
        form = isi_kontrakForm(request.POST, instance=data_isikontraks)
        if form.is_valid():
            form.save()

            return redirect('list_pdf')
    else:
        form = isi_kontrakForm(instance=data_isikontraks)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_isikontraks
    }
    return render(request, 'form.html', context)

@login_required(login_url='login')
def Update_status(request, pk):
    user = request.user
    mail = user.email
    data_isikontraks = isi_kontrak.objects.get(id=pk)
    if data_isikontraks.status == False:
        data_isikontraks.status = True
        data_isikontraks.save()
    elif data_isikontraks.status == True:
        data_isikontraks.status = False
        data_isikontraks.save()
    next = request.POST.get('next', '/')
    context = {
        'mail': mail,
        'data_isikontraks': data_isikontraks
    }
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))


@login_required(login_url='login')
def Delete_isikontrak(request, pk):
    data_isikontraks = isi_kontrak.objects.get(id=pk)
    data_isikontraks.delete()
    return redirect('list_pdf')

#Perusahaan
#list Perusahaan
@login_required(login_url='login')
def list_perusahaan(request):
    Data_perusahaan = perusahaan.objects.all()
    context = {
        'rows': Data_perusahaan,
    }
    return render(request, 'list_perusahaan.html', context)

#detail Perusahaan
@login_required(login_url='login')
def perusahaan_detail(request, pk):
    Data_perusahaan = kontrak.objects.get(id=pk)
    context = {
        'rows': Data_perusahaan,
    }
    return render(request, 'detail_perusahaan.html', context)

@login_required(login_url='login')
def Create_perusahaan(request):
    user = request.user
    mail = user.email
    if request.method == 'POST':
        form = PerusahaanForm(request.POST)
        if form.is_valid():
            form = form.save()

            return redirect('list_perusahaan')
    else:
        form = PerusahaanForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Update_perusahaan(request, pk):
    user = request.user
    mail = user.email
    data_perusahaan = perusahaan.objects.get(id=pk)
    if request.method == 'POST':
        form = PerusahaanForm(request.POST, instance=data_perusahaan)
        if form.is_valid():
            form.save()

            return redirect('list_perusahaan')
    else:
        form = PerusahaanForm(instance=data_perusahaan)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_perusahaan
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Delete_perusahaan(request, pk):
    data_perusahaan = perusahaan.objects.get(id=pk)
    data_perusahaan.delete()
    return redirect('list_perusahaan')

#Kwitansi
#list Kwitansi
@login_required(login_url='login')
def list_kwitansi(request):
    Data_kwitansi = kwitansi.objects.all().order_by('-tanggal')
    context = {
        'rows': Data_kwitansi,
    }
    return render(request, 'list_kwitansi.html', context)

#detail Perusahaan
@login_required(login_url='login')
def kwitansi_detail(request, pk):
    Data_kwitansi = kwitansi.objects.filter(id=pk)
    # Data_kontrak = kontrak.objects.filter(id=pk)
    Data_isikwitansi = isi_kwitansi.objects.filter(id_kwitansi=pk)
    list_namabarang=[]
    for kwitansis in Data_isikwitansi:
        nama_barang = kwitansis.id_isikontrak.nama_barang
        list_namabarang.append(nama_barang)
    
    df = pd.DataFrame.from_records(Data_isikwitansi.values())
    df['total']=df['jumlah']*df['harga']
    df['nama_barang']=list_namabarang
    total=df['total'].sum()
    pajak=total*0.11
    totalall=total+pajak
    
    
    df=df.values.tolist()
    # print(Data_kwitansi[0])
    context = {
        'rows': Data_kwitansi[0],
        'rows2': df,
        'total':total,
        'pajak':pajak,
        'totalall':int(totalall),
        
    }
    return render(request, 'detail_kwitansi.html', context)


@login_required(login_url='login')
def Create_kwitansi(request):
    user = request.user
    mail = user.email
    id_isikontrak = request.POST.getlist('id_isikontrak')
    satuans = request.POST.getlist('satuan')
    jumlahs = request.POST.getlist('jumlah')
    hargas = request.POST.getlist('harga')
    isikontrakss = isi_kontrak.objects.all()
    
    if request.method == 'POST':
        form = KwitansiForm(request.POST)
        
        if form.is_valid():
            
            kwitansis = kwitansi()
            kwitansis.no_kwitansi = form.cleaned_data.get('no_kwitansi')
            kwitansis.penerima = form.cleaned_data.get('penerima')
            kwitansis.tanggal = form.cleaned_data.get('tanggal')
            kwitansis.save()

            data_kwitansis = kwitansi.objects.get(no_kwitansi=form.cleaned_data.get('no_kwitansi'))
            for i in range(len(satuans)):
                isi_kwitansis = isi_kwitansi()
                isi_kwitansis.id_kwitansi = data_kwitansis
                isikontrak = isi_kontrak.objects.get(id=id_isikontrak[i])
                isi_kwitansis.id_isikontrak = isikontrak
                isi_kwitansis.satuan = satuans[i]
                isi_kwitansis.jumlah = jumlahs[i]
                isi_kwitansis.harga = hargas[i]
                isi_kwitansis.save()
            return redirect('/list_kwitansi')
            #return HttpResponse('Success')
    else:
        form = KwitansiForm()
    context = {
        'form': form,
        'mail': mail,
        'rows': isikontrakss,
    }
    return render(request, 'form_kwitansi.html', context)


@login_required(login_url='login')
def Update_Kwitansi(request, pk):
    user = request.user
    mail = user.email
    pk = pk
    data_isi_kwitansis = isi_kwitansi.objects.filter(id_kwitansi=pk)
    
    
    data_kwitansis = kwitansi.objects.get(id=pk)
    isikontrakss = isi_kontrak.objects.all()
    id_isikontrak = request.POST.getlist('id_isikontrak')
    satuans = request.POST.getlist('satuan')
    jumlahs = request.POST.getlist('jumlah')
    hargas = request.POST.getlist('harga')
    if request.method == 'POST':
        form = KwitansiForm(request.POST, instance=data_kwitansis)

        if form.is_valid():    
            kwitansis = kwitansi()
            kwitansis.no_kwitansi = form.cleaned_data.get('no_kwitansi')
            kwitansis.penerima = form.cleaned_data.get('penerima')
            kwitansis.tanggal = form.cleaned_data.get('tanggal')
            data_kwitansis.delete()
            data_isi_kwitansis.delete()
            kwitansis.save()

            data_kwitansis = kwitansi.objects.get(no_kwitansi=request.POST.get('no_kwitansi'))
            for i in range(len(satuans)):
                isi_kwitansis = isi_kwitansi()
                isi_kwitansis.id_kwitansi = data_kwitansis
                isikontrak = isi_kontrak.objects.get(id=id_isikontrak[i])
                isi_kwitansis.id_isikontrak = isikontrak
                isi_kwitansis.id_isikontrak = isikontrak
                isi_kwitansis.satuan = satuans[i]
                isi_kwitansis.jumlah = jumlahs[i]
                isi_kwitansis.harga = hargas[i]
                isi_kwitansis.save()
            return redirect('/list_kwitansi')
            #return HttpResponse('Success')
    else:
        form = KwitansiForm()
    #print(data_isiSJalans.query)
    context = {
        'form': form,
        'mail': mail,
        'rows': isikontrakss, 
        'rows1': data_isi_kwitansis,
        'data_kwitansis': data_kwitansis,
        'pk': pk
    }
    return render(request, 'form_kwitansiUpdate.html', context)


@login_required(login_url='login')
def Delete_kwitansi(request, pk):
    data_kwitansi = kwitansi.objects.get(id=pk)
    data_kwitansi.delete()
    return redirect('list_kwitansi')

#isi kwitansi
@login_required(login_url='login')
def Create_isi_Kwitansi(request, pk):
    user = request.user
    mail = user.email
    data_kwitansis = kwitansi.objects.get(id=pk)
    if request.method == 'POST':
        form = isi_KwitansiForm(request.POST)
        if form.is_valid():
            #form = form.save(commit=False)
            isi_Kwitansis = isi_kwitansi()
            isi_Kwitansis.id_kwitansi = data_kwitansis
            isi_Kwitansis.nama_barang = form.cleaned_data.get('nama_barang')
            isi_Kwitansis.spesifikasi = form.cleaned_data.get('spesifikasi')
            isi_Kwitansis.satuan = form.cleaned_data.get('satuan')
            harga=form.cleaned_data.get('harga')
            jumlah=form.cleaned_data.get('jumlah')
            total=harga*jumlah
            isi_Kwitansis.harga = harga
            isi_Kwitansis.jumlah = jumlah
            isi_Kwitansis.total=total
            isi_Kwitansis.save()

            return redirect('list_kwitansi')
    else:
        form = isi_KwitansiForm()
    context = {
        'form': form,
        'mail': mail,
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Update_isi_Kwitansi(request, pk):
    user = request.user
    mail = user.email
    data_isi_kwitansis = isi_kwitansi.objects.get(id=pk)
    if request.method == 'POST':
        form = isi_kontrakForm(request.POST, instance=data_isi_kwitansis)
        if form.is_valid():
            form.save()

            return redirect('list_kwitansi')
    else:
        form = isi_KwitansiForm(instance=data_isi_kwitansis)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_isi_kwitansis
    }
    return render(request, 'form.html', context)

@login_required(login_url='login')
def Delete_isi_Kwitansi(request, pk):
    data_isi_kwitansis = isi_kwitansi.objects.get(id=pk)
    data_isi_kwitansis.delete()
    return redirect('list_kwitansi')


#isi kwitansi
@login_required(login_url='login')
def Create_SJalan(request, pk):
    user = request.user
    mail = user.email
    data_kontraks = kontrak.objects.get(id=pk)
    
    if request.method == 'POST':
        form = SJalanForm(request.POST)
        if form.is_valid():
            SJalans = SJalan()
            SJalans.id_kontrak = data_kontraks
            SJalans.no_surat = form.cleaned_data.get('no_surat')
            SJalans.pemesan = form.cleaned_data.get('pemesan')
            SJalans.no_hp = form.cleaned_data.get('no_hp')
            SJalans.tanggal = form.cleaned_data.get('tanggal')
            SJalans.save()

            return redirect('/list_Sjalan/'+pk)
    else:
        form = SJalanForm()
    context = {
        'form': form,
        'mail': mail,
        'rows': data_kontraks
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Update_SJalan(request, pk):
    user = request.user
    mail = user.email
    data_SJalans = SJalan.objects.get(id=pk)
    if request.method == 'POST':
        form = SJalanForm(request.POST, instance=data_SJalans)
        if form.is_valid():
            form.save()

            return redirect('dashboard')
    else:
        form = SJalanForm(instance=data_SJalans)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_SJalans
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Delete_SJalan(request, pk, uk):
    data_SJalans = SJalan.objects.get(id=pk)
    data_SJalans.delete()
    return redirect('/list_SJalan/'+uk)

#list SJalan
@login_required(login_url='login')
def list_SJalan(request, pk):
    pk=pk
    Data_SJalan = SJalan.objects.filter(id_kontrak=pk)

    Data_kontrak = kontrak.objects.filter(id=pk)
    context = {
        'rows': Data_SJalan,
        'pk':pk,
        'dok':Data_kontrak[0]
    }
    return render(request, 'list_sjalan.html', context)



#isi kwitansi


@login_required(login_url='login')
def Create_isiSJalan(request, pk):
    user = request.user
    mail = user.email
    pk=pk
    data_SJalans = SJalan.objects.get(id=pk)
    isikontrakss = isi_kontrak.objects.filter(id_kontrak=data_SJalans.id_kontrak)
    if request.method == 'POST':
        form = Isi_SJalanForm(request.POST)
        if form.is_valid():
            isi_SJalans = isi_SJalan()
            isi_SJalans.id_SJalan = data_SJalans
            isi_SJalans.id_isikontrak = form.cleaned_data.get('id_isikontrak')
            isi_SJalans.jumlah = form.cleaned_data.get('jumlah')
            isi_SJalans.nomor_dos = form.cleaned_data.get('nomor_dos')
            isi_SJalans.save()

            return redirect('dashboard')
    else:
        form = Isi_SJalanForm()
    context = {
        'form': form,
        'mail': mail,
        'rows': isikontrakss,
        'pk':pk
    }
    return render(request, 'form_sjalan.html', context)


@login_required(login_url='login')
def Update_isiSJalan(request, pk):
    user = request.user
    mail = user.email
    data_isiSJalans = isi_SJalan.objects.get(id=pk)
    if request.method == 'POST':
        form = Isi_SJalanForm(request.POST, instance=data_isiSJalans)
        if form.is_valid():
            form.save()

            return redirect('dashboard')
    else:
        form = Isi_SJalanForm(instance=data_isiSJalans)
    context = {
        'form': form,
        'mail': mail,
        'rows': data_isiSJalans
    }
    return render(request, 'form.html', context)


@login_required(login_url='login')
def Delete_isiSJalan(request, pk):
    data_isiSJalans = isi_SJalan.objects.get(id=pk)
    data_isiSJalans.delete()
    return redirect('dashboard')

#list SJalan


@login_required(login_url='login')
def detail_isiSJalan(request, pk):
    pk=pk
    Data_isiSJalan = isi_SJalan.objects.filter(id_SJalan=pk)
    context = {
        'rows': Data_isiSJalan,
        'pk':pk
    }
    return render(request, 'detail_sjalan.html', context)


@login_required(login_url='login')
def Create_SuratJ(request, pk):
    user = request.user
    mail = user.email
    pk = pk
    data_kontraks = kontrak.objects.get(id=pk)
    isikontrakss = isi_kontrak.objects.filter(id_kontrak=data_kontraks)
    id_isikontrak = request.POST.getlist('id_isikontrak')
    jumlah = request.POST.getlist('jumlah')
    nomor_dos = request.POST.getlist('nomor_dos')
    
    
    if request.method == 'POST':
        form = SJalanForm(request.POST)
        
        if form.is_valid():
            
            SJalans = SJalan()
            SJalans.id_kontrak = data_kontraks
            SJalans.no_surat = form.cleaned_data.get('no_surat')
            SJalans.pemesan = form.cleaned_data.get('pemesan')
            SJalans.no_hp = form.cleaned_data.get('no_hp')
            SJalans.tanggal = form.cleaned_data.get('tanggal')
            SJalans.save()

            data_SJalans = SJalan.objects.get(no_surat=form.cleaned_data.get('no_surat'))
            for i in range(len(id_isikontrak)):
                isi_SJalans = isi_SJalan()
                isi_SJalans.id_SJalan = data_SJalans
                isikontrak = isi_kontrak.objects.get(id=id_isikontrak[i])
                isi_SJalans.id_isikontrak = isikontrak
                isi_SJalans.jumlah = jumlah[i]
                isi_SJalans.nomor_dos = nomor_dos[i]
                isi_SJalans.save()
            return redirect('/list_SJalan/'+str(pk))
            #return HttpResponse('Success')
    else:
        form = SJalanForm()
    context = {
        'form': form,
        'mail': mail,
        'rows': isikontrakss,
        'pk': pk,
        'uk': pk
    }
    return render(request, 'form_surat.html', context)


@login_required(login_url='login')
def Update_SuratJ(request, pk, uk):
    user = request.user
    mail = user.email
    pk = pk
    data_isiSJalans = isi_SJalan.objects.filter(id_SJalan=pk)
    
    
    data_SJalans = SJalan.objects.get(id=pk)
    isikontrakss = isi_kontrak.objects.filter(id_kontrak=data_SJalans.id_kontrak)
    id_isikontrak = request.POST.getlist('id_isikontrak')
    jumlah = request.POST.getlist('jumlah')
    nomor_dos = request.POST.getlist('nomor_dos')
    if request.method == 'POST':
        form = SJalanForm(request.POST, instance=data_SJalans)

        if form.is_valid():    
            SJalans = SJalan()
            SJalans.id_kontrak = data_SJalans.id_kontrak
            SJalans.no_surat = request.POST.get('no_surat')
            SJalans.pemesan = form.cleaned_data.get('pemesan')
            SJalans.no_hp = form.cleaned_data.get('no_hp')
            SJalans.tanggal = form.cleaned_data.get('tanggal')
            data_SJalans.delete()
            data_isiSJalans.delete()
            SJalans.save()

            data_SJalans = SJalan.objects.get(no_surat=request.POST.get('no_surat'))
            for i in range(len(id_isikontrak)):
                isi_SJalans = isi_SJalan()
                isi_SJalans.id_SJalan = data_SJalans
                isikontrak = isi_kontrak.objects.get(id=id_isikontrak[i])
                isi_SJalans.id_isikontrak = isikontrak
                isi_SJalans.jumlah = jumlah[i]
                isi_SJalans.nomor_dos = nomor_dos[i]
                isi_SJalans.save()
            return redirect('/list_SJalan/'+str(uk))
            #return HttpResponse('Success')
    else:
        form = SJalanForm()
    print(data_isiSJalans.query)
    context = {
        'form': form,
        'mail': mail,
        'rows': isikontrakss, 
        'rows1': data_isiSJalans,
        'data_SJalans': data_SJalans,
        'pk': pk,
        'uk': uk
    }
    return render(request, 'form_suratUpdate.html', context)


@login_required(login_url='login')
def detail_SuratJ(request, pk, uk):
    pk = pk
    data_isiSJalans = isi_SJalan.objects.filter(id_SJalan=pk)
    data_SJalans = SJalan.objects.get(id=pk)
    Data_kontrak = kontrak.objects.filter(id=pk)

    context = {
        'rows': data_SJalans,
        'rows1': data_isiSJalans,
        'uk': uk,
        'pk': pk,
        'id_list_jalan':Data_kontrak
    }
    return render(request, 'detail_sjalan.html', context)


@login_required(login_url='login')
def Delete_SuratJ(request, pk):
    data_SuratJ = SuratJ.objects.get(id=pk)
    data_SuratJ.delete()
    return redirect('/list_SJalan/'+str(pk))

