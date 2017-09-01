from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.dashboard, name='dashboard'),
    url(r'^api/offices_risk/(?P<indicator_type>\d+)?/?$', views.offices_risk, name='offices_risk')
]

