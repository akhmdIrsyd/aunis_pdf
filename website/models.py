from django.db import models

from django.core.validators import FileExtensionValidator
from django.core.exceptions import ValidationError
# Create your models here.


def _upload_path(instance, filename):
    return instance.get_upload_path(filename)


def file_size(value):  # add this to some file where you can import it from
    limit = 2 * 1024 * 1024
    if value.size > limit:
        raise ValidationError('File too large. Size should not exceed 2 MB.')


class kontrak(models.Model):
    kode = models.CharField(max_length=50, unique=True)
    nama_perusahaan = models.CharField(max_length=50)
    tanggal = models.DateField()
    file_pdf = models.FileField(upload_to=_upload_path, blank=True, null=True, validators=[FileExtensionValidator(['pdf']), file_size])
    
    def get_upload_path(self, filename):
        return "uploads/"+str(self.kode)+"/"+filename
    def __str__(self):
        return str(self.kode)

class isi_kontrak(models.Model):
    id_kontrak = models.ForeignKey(kontrak, on_delete=models.CASCADE)
    Code_Purchase = models.CharField(max_length=50)
    nama_barang = models.CharField(max_length=50)
    spesifikasi = models.CharField(max_length=50)
    tujuan = models.CharField(max_length=50)
    satuan = models.CharField(max_length=50)
    jumlah = models.CharField(max_length=50)
    harga = models.CharField(max_length=50)
    total = models.CharField(max_length=50)
    total = models.CharField(max_length=50)
    status = models.BooleanField(default=False)

    def __str__(self):
        return str(self.Code_Purchase)
