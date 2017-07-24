from django.contrib import admin
from .models import Indicator, Office, Region
# Register your models here.

admin.site.register(Indicator)
admin.site.register(Office)
admin.site.register(Region)