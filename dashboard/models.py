7# from django.db import models
from datetime import datetime
from django.contrib.gis.db import models
from django.db import connections

# Create your models here.
class BaseModel(models.Model):
	# created_at = models.DateTimeField(auto_now_add=True)
	# updated_at = models.DateTimeField(auto_now=True)

	class Meta:
		abstract = True

class Category(BaseModel):
	name = models.CharField(max_length=50)

	def __str__(self):
		return self.name

class IndicatorType(BaseModel):
	name = models.CharField(max_length=50)
	# key = models.CharField(max_length=50, unique=True)

	def __str__(self):
		return self.name

class Indicator(BaseModel):
	name = models.CharField(max_length=50)
	# key = models.CharField(max_length=50, unique=True)
	categories = models.ManyToManyField(Category, through='IndicatorCategory')

	def __str__(self):
		return self.name


class Region(BaseModel):
	name = models.CharField(max_length=50)
	map_id = models.CharField(max_length=20)
	area = models.PolygonField(null=True)

	def __str__(self):
		return self.name

class IndicatorCategory(BaseModel):
	weight = models.IntegerField()
	indicator = models.ForeignKey(Indicator, on_delete=models.PROTECT)
	category = models.ForeignKey(Category, on_delete=models.PROTECT)

	region = models.ForeignKey(Region, on_delete=models.PROTECT)

	def __str__(self):
		return self.name

class Office(BaseModel):
	code = models.CharField(max_length=50)
	name = models.CharField(max_length=50)
	address = models.CharField(max_length=50)
	location = models.PointField(null=True)
	region = models.ForeignKey(Region, on_delete=models.PROTECT)

	def __str__(self):
		return self.name

class IndicatorData(BaseModel):
	load_date = models.DateField(max_length=50)
	amount = models.DecimalField(max_digits=10, decimal_places=2)
	indicator = models.ForeignKey(Indicator,on_delete=models.PROTECT)
	indicator_type = models.ForeignKey(IndicatorType, on_delete=models.PROTECT);
	office = models.ForeignKey(Office, on_delete=models.PROTECT)



class Dashboard():
	@staticmethod
	def dictfetchall(sql):
		connection = connections['default']
		with connection.cursor() as cursor:
			cursor.execute(sql)
			"Return all rows from a cursor as a dict"
			columns = [col[0] for col in cursor.description]
			return [
				dict(zip(columns, row))
				for row in cursor.fetchall()
			]

	@staticmethod
	def get_view(view_name):
		return Dashboard.dictfetchall('select * from {0}'.format(view_name))

	@staticmethod
	def get_sql_data(sql):
		return Dashboard.dictfetchall(sql)
