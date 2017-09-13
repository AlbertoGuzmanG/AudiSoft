from datetime import datetime
from django.contrib.auth.models import User
from django.db import models, connections
from django.shortcuts import get_object_or_404
from ldap3 import Server, Connection

# Create your models here.
class BaseModel(models.Model):
	# created_at = models.DateTimeField(auto_now_add=True)
	# updated_at = models.DateTimeField(auto_now=True)

	class Meta:
		abstract = True

class Category(BaseModel):
	name = models.CharField(max_length=50)
	description = models.CharField(max_length=600)

	def __str__(self):
		return self.name

class IndicatorType(BaseModel):
	name = models.CharField(max_length=50)
	# key = models.CharField(max_length=50, unique=True)

	def __str__(self):
		return self.name

class Indicator(BaseModel):
	code = models.CharField(max_length=50)
	name = models.CharField(max_length=100)
	description = models.CharField(max_length=600)
	# key = models.CharField(max_length=50, unique=True)
	categories = models.ManyToManyField(Category, through='IndicatorCategory')

	def __str__(self):
		return self.name


class Region(BaseModel):
	name = models.CharField(max_length=50)
	map_id = models.CharField(max_length=20)
	area = models.TextField(max_length=400000)

	def __str__(self):
		return self.name

class IndicatorCategory(BaseModel):
	weight = models.IntegerField()
	indicator = models.ForeignKey(Indicator, on_delete=models.PROTECT)
	category = models.ForeignKey(Category, on_delete=models.PROTECT)
	indicator_type = models.ForeignKey(IndicatorType, on_delete=models.PROTECT);

	def __str__(self):
		return self.name

class CategoryWeight(BaseModel):
	weight = models.IntegerField()
	indicator_type = models.ForeignKey(IndicatorType, on_delete=models.PROTECT);
	category = models.ForeignKey(Category, on_delete=models.PROTECT)

class Office(BaseModel):
	code = models.CharField(max_length=50)
	name = models.CharField(max_length=50)
	address = models.CharField(max_length=50)
	location = models.CharField(max_length=500)
	region = models.ForeignKey(Region, on_delete=models.PROTECT)
	schedule = models.CharField(max_length=500)
	office_type = models.CharField(max_length=4)

	def __str__(self):
		return self.name

class IncidenceFile(BaseModel):
	path = models.CharField(max_length=300)

	def __str__(self):
		return self.path.split[-1] # return filename

class IndicatorData(BaseModel):
	load_date = models.DateField(max_length=50)
	amount = models.DecimalField(max_digits=15, decimal_places=2)
	indicator = models.ForeignKey(Indicator,on_delete=models.PROTECT)
	indicator_type = models.ForeignKey(IndicatorType, on_delete=models.PROTECT);
	attached_file = models.ForeignKey(IncidenceFile, on_delete=models.PROTECT);
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

class AuthenticationBackend():
	'''Define custom authentication validating user with active directory'''

	def validate_ldap(self, username, password):
		'''Try to establish a connection with ldap '''
		try:
			server = Server('ldap://reservas.BRRD.com')
			connection = Connection(server, user='brrd\%s' % username , password=password)
			connection.open()
			return connection.bind()
		except Exception:
			raise Exception('El servicio de ldap puede no estar funcionando adecuadamente.')

	def authenticate(self, request, username=None, password=None):
		if self.validate_ldap(username, password):
			user = get_object_or_404(User, username=username)
			return user
		else:
			return None

	def get_user(self, user_id):
		try:
			return User.objects.get(pk=user_id)
		except User.DoesNotExist:
			return None
