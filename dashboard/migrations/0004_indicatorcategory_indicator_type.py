# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-22 13:16
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dashboard', '0003_categoryweight'),
    ]

    operations = [
        migrations.AddField(
            model_name='indicatorcategory',
            name='indicator_type',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.PROTECT, to='dashboard.IndicatorType'),
            preserve_default=False,
        ),
    ]