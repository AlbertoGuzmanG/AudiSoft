from dashboard.models import  Office
from rest_framework import viewsets, generics, permissions
from .serializers import OfficeSerializer

class OfficeViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    model = Office
    queryset = Office.objects.all()
    serializer_class = OfficeSerializer
    pagination_class = None
    permission_classes = [
        permissions.AllowAny
    ]
