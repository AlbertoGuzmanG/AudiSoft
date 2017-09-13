from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from AudISoft.extension import JsonResponse, mainpage_if_logged
from .models import Dashboard
from .submodels.office_model import OfficeModel
from json import loads as json_decode

# Create your views here.

def dashboard(request):
	return render(request,'dashboard/index.html')

def offices_risk(request, indicator_type = 1):
	res_object = {}
	risk_information = OfficeModel().get_risk(indicator_type)

	offices = []
	regions = []
	for office in risk_information['offices']:
		location = office['location'].split(',')
		offices.append({
			"type":"Feature",
			"properties":{
				"Y": float(location[0]),
				"X":float(location[1]),
				"region":office['region'],
				'risk': office['risk'],
				"info":{
					"code": {"label": "Código", "value": office['code']},
					"address": {"label": "Dirección", "value": office['address']},
					"schedule": {"label": "Horario", "value": office['schedule']},
					"office_name": {"label": "Oficina", "value": office['name']},
					"region": {"label": "Región", "value": office['region']},
					"type": {"label": "Tipo", "value":  office['type']},
					"risk": {"label": "Riesgo", "value": office['risk']},
				}
			},
			"geometry":{
				"type":"Point",
				"coordinates":[float(location[1]), float(location[0])]
			}
		})

	for index in risk_information['regions']:
		region = risk_information['regions'][index]
		regions.append({
		    "type": "Feature",
		    "properties": {
		      "id": region['id'],
		      "info": {
		        "region_name": {"label": "Región","value": region['name']},
		        "clients_count": {"label": "Clientes","value": " 340 "},
		        "risk": {"label": "Riesgo","value": region['risk']
		        }
		      }
		    },
		    "geometry": {
		      "type": "Polygon",
		      "coordinates": [
		          json_decode(region['location']) if region['location'] != None else []
		      ]
		    }
		})

	# append summarized office info
	risky_offices = OfficeModel().risky_offices(risk_information['offices'])

	return JsonResponse({'offices': offices, 'regions': regions, 'offices_risk' : risky_offices}, safe=False)