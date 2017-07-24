from django.db import models
from datetime import datetime

# Create your models here.
class BaseModel(models.Model):
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	class Meta:
		abstract = True

class Indicator(BaseModel):
    name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class IndicatorData(BaseModel):
    load_date = models.DateField(max_length=50)
    amount = models.DecimalField(max_digits=10, decimal_places=2)

class IndicatorType(BaseModel):
    name = models.CharField(max_length=50)
    key = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Region(BaseModel):
    name = models.CharField(max_length=50)
    map_id = models.CharField(max_length=50)

    def __str__(self):
        return self.name

class Office(BaseModel):
    name = models.CharField(max_length=50)
    longitude = models.DecimalField(max_digits=10, decimal_places=8)
    latitude = models.DecimalField(max_digits=10, decimal_places=8)
    code = models.CharField(max_length=50)
    address = models.CharField(max_length=50)
    region_map = models.CharField(max_length=50)

    def __str__(self):
        return self.name