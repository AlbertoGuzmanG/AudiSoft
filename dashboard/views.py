from django.shortcuts import render
from django.http import HttpResponse
from AudISoft.extension import JsonResponse

from .models import Dashboard

# Create your views here.

def dashboard(request):
    return render(request,'dashboard/index.html')

def dashboard_data(request):
	res_object = {}
	res_object['top_ten_indicator'] = Dashboard.get_view('top_ten_indicator')
	res_object['incidents_by_category'] = Dashboard.get_view('incidents_by_category')
	res_object['indicators_behaviour_last_y'] = Dashboard.get_view('indicators_behaviour_last_y')

	return JsonResponse(res_object, safe=False)
