# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-09-12 18:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='IncidenceFile',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('path', models.CharField(max_length=300)),
            ],
            options={
                'abstract': False,
            },
        ),
    ]