from django.shortcuts import render
from django.http import HttpResponse
from AudISoft.extension import JsonResponse
from .models import Dashboard
from .submodels.office_model import OfficeModel
# Create your views here.

def dashboard(request):
	return render(request,'dashboard/index.html')

def office_risk(request):
	res_object = {}
	risk_information = OfficeModel().get_risk(1)

	offices = []
	for office in risk_information['offices']:

		offices.append({
			"type": "Feature",
			"properties": {
				"Y": office['location'][1],
				"X": office['location'][0],
				"info": {
					"code": {"label": "Código", "value": office['code']},
					"address": {"label": "Dirección", "value": office['address']},
					"schedule": {"label": "Horario", "value": office['schedule']},
					"office_name": {"label": "Oficina", "value": office['name']},
					"region": {"label": "Región", "value": office['region']},
					"type": {"label": "Tipo", "value": "SUC"},
					'info': office['categories'],
					'risk': office['risk']
				}
			}
		})

	return JsonResponse({'offices': offices}, safe=False)

def dashboard_data(request):
	res_object = {}
	res_object['top_ten_indicator'] = Dashboard.get_view('top_ten_indicator')
	res_object['incidents_by_category'] = Dashboard.get_view('incidents_by_category')
	res_object['indicators_behaviour_last_y'] = Dashboard.get_view('indicators_behaviour_last_y')
	res_object['indicators_behaviour_last_y'] = Dashboard.get_view('indicators_behaviour_last_y')
	return JsonResponse(res_object, safe=False)
