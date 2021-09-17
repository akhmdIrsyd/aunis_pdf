from django.contrib import admin

# Register your models here.
from .models import kontrak, isi_kontrak, perusahaan

# Register your models here.
admin.site.register(kontrak)
admin.site.register(isi_kontrak)
admin.site.register(perusahaan)
