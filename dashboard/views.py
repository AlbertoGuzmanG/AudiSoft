from django.shortcuts import render
from django.http import HttpResponse
from AudISoft.extension import JsonResponse
from .models import Dashboard
from .submodels.office_model import OfficeModel
# Create your views here.

def dashboard(request):
	return render(request,'dashboard/index.html')

def map_offices_risk(request, indicator_type = 1):
	res_object = {}
	risk_information = OfficeModel().get_risk(indicator_type)

	offices = []
	regions = []
	for office in risk_information['offices']:
		offices.append({
			"type":"Feature",
			"properties":{
				"Y":office['location'][0],
				"X":office['location'][1],
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
				"coordinates":[office['location'][1], office['location'][0]]
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
		          region['location']
		      ]
		    }
		})

	return JsonResponse({'offices': offices, 'regions': regions}, safe=False)