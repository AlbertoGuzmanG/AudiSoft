from dashboard.models import  Office
from rest_framework import serializers

class OfficeSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Office
        fields = ('code' ,'name',)
