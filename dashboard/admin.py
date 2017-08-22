from django.contrib import admin
from dashboard.models import Indicator, Office, Region
from dashboard.submodels.office_model import OfficeModel
# Register your models here.

class RegionAdmin(admin.ModelAdmin):
	fields = ('name',)

class OfficeAdmin(admin.ModelAdmin):
	fields = ('name',)

admin.site.register(Indicator)
admin.site.register(Region, RegionAdmin)
admin.site.register(Office, OfficeAdmin)
