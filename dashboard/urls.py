from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.dashboard, name='dashboard'),
    url(r'^data$', views.dashboard_data, name='dashboard_data'),
]

