from django.contrib import admin

# Register your models here.
from .models import kontrak, isi_kontrak, perusahaan, kwitansi, isi_kwitansi, SJalan, isi_SJalan

# Register your models here.
admin.site.register(kontrak)
admin.site.register(isi_kontrak)
admin.site.register(perusahaan)
admin.site.register(SJalan)
admin.site.register(isi_SJalan)
admin.site.register(kwitansi)
admin.site.register(isi_kwitansi)
