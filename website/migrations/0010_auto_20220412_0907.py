# Generated by Django 3.1.4 on 2022-04-12 02:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0009_suratj'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sjalan',
            name='no_surat',
            field=models.CharField(max_length=50, unique=True),
        ),
    ]
