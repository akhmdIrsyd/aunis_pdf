# Generated by Django 3.1.4 on 2021-09-17 09:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='kontrak',
            name='date_upload',
            field=models.DateField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='kontrak',
            name='kode',
            field=models.CharField(max_length=50),
        ),
    ]
