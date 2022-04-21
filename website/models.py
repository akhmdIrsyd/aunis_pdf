from django.db import models

from django.core.validators import FileExtensionValidator
from django.core.exceptions import ValidationError
from django.conf import settings
# Create your models here.


def _upload_path(instance, filename):
    return instance.get_upload_path(filename)


def file_size(value):  # add this to some file where you can import it from
    limit = 2 * 1024 * 1024
    if value.size > limit:
        raise ValidationError('File too large. Size should not exceed 2 MB.')


class perusahaan(models.Model):
    kode_perusahaan = models.CharField(max_length=50, unique=True)
    nama_perusahaan = models.CharField(max_length=50)
    alamat = models.TextField(max_length=255, blank=True, null=True, default='')
    npwp = models.CharField(max_length=50, blank=True, null=True, default='')

    def __str__(self):
        return str(self.kode_perusahaan)

class kontrak(models.Model):
    file_pdf = models.FileField(upload_to=_upload_path, blank=True, null=True, validators=[FileExtensionValidator(['pdf']), file_size])
    kode = models.CharField(max_length=50)
    date_upload = models.DateField(auto_now_add=True)
    def get_upload_path(self, filename):
        return "uploads/"+filename

    def __str__(self):
        return str(self.file_pdf)

class isi_kontrak(models.Model):
    id_kontrak = models.ForeignKey(kontrak, on_delete=models.CASCADE)
    no_kontrak = models.CharField(max_length=50)
    Code_Purchase = models.CharField(max_length=50)
    nama_barang = models.CharField(max_length=255)
    spesifikasi = models.CharField(max_length=255)
    satuan = models.CharField(max_length=50)
    jumlah = models.IntegerField()
    harga = models.IntegerField()
    total = models.IntegerField()
    id_perusahaan = models.ForeignKey(perusahaan, on_delete=models.CASCADE)
    supplier = models.CharField(max_length=50, default="TOKO AUNIS PRINT OFFSET")
    tgl_order = models.DateField()
    waktu = models.CharField(max_length=50, default='45')
    tgl_penyerahan = models.DateField()
    status = models.BooleanField(default=False)

    def __str__(self):
        return str(self.nama_barang)


class kwitansi(models.Model):
    KWITANSI_TYPE_CHOICES = (
        (1, 'Kwitansi'),
        (2, 'Nota')
    )
    kwitansi_type = models.PositiveIntegerField(choices=KWITANSI_TYPE_CHOICES, default=1)
    kode_invoice = models.CharField(max_length=50, unique=True)
    nama_perusahaan = models.CharField(max_length=50)
    tanggal = models.DateField()


class isi_kwitansi(models.Model):
    id_kwitansi = models.ForeignKey(kwitansi, on_delete=models.CASCADE)
    nama_barang = models.CharField(max_length=50)
    spesifikasi = models.CharField(max_length=50)
    satuan = models.CharField(max_length=50)
    harga = models.IntegerField()
    jumlah = models.IntegerField()
    total = models.IntegerField()


class SJalan(models.Model):
    id_kontrak = models.ForeignKey(kontrak, on_delete=models.CASCADE)
    no_surat = models.CharField(max_length=50, unique=True)
    pemesan = models.CharField(max_length=50)
    no_hp = models.CharField(max_length=50)
    tanggal = models.DateField()

    def __str__(self):
        return str(self.no_surat)


class isi_SJalan(models.Model):
    id_SJalan = models.ForeignKey(SJalan, on_delete=models.CASCADE)
    id_isikontrak = models.ForeignKey(isi_kontrak, on_delete=models.CASCADE)
    jumlah = models.IntegerField()
    nomor_dos = models.IntegerField()


class SuratJ(models.Model):
    id_kontrak = models.ForeignKey(kontrak, on_delete=models.CASCADE)
    no_surat = models.CharField(max_length=50)
    pemesan = models.CharField(max_length=50)
    no_hp = models.CharField(max_length=50)
    tanggal = models.DateField()
    id_isikontrak = models.ForeignKey(isi_kontrak, on_delete=models.CASCADE)
    jumlah = models.IntegerField()
    nomor_dos = models.IntegerField()
