from django.shortcuts import render
from django.http import HttpResponse
from AudISoft.extension import JsonResponse
from .models import Dashboard
from .submodels.office_model import OfficeModel
# Create your views here.

def dashboard(request):
	return render(request,'dashboard/index.html')

def office_risk():
	res_object = {}
	res_object['office_risk'] = OfficeModel().get_risk()
	return JsonResponse(res_object, safe=False)

def dashboard_data(request):
	res_object = {}
	res_object['top_ten_indicator'] = Dashboard.get_view('top_ten_indicator')
	res_object['incidents_by_category'] = Dashboard.get_view('incidents_by_category')
	res_object['indicators_behaviour_last_y'] = Dashboard.get_view('indicators_behaviour_last_y')
	res_object['indicators_behaviour_last_y'] = Dashboard.get_view('indicators_behaviour_last_y')
	return JsonResponse(res_object, safe=False)
