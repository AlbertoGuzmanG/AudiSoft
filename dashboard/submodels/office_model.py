# from django.db import models
from dashboard.models import Office, IndicatorCategory, Dashboard
from dashboard.sql_view_manager import ViewManager
from pprint import pprint

class OfficeModel(Office):

	#Getting total ammount of each indicator
	def sum_by_indicator(self, indicators_data):
		total_indicator_ammount = {}
		for indicator in indicators_data:
			ammount = indicator['amount']
			indicator_id = indicator['indicator_id']
			total_indicator_ammount[indicator_id] = total_indicator_ammount[indicator_id] + ammount if indicator_id in total_indicator_ammount else ammount

		return total_indicator_ammount

	#Getting risk by indicator and office
	def get_indicator_risk_by_office(self, indicators_data):
		indicators_risk = {}
		totals = self.sum_by_indicator(indicators_data)		

		for indicator in indicators_data:
			ammount = indicator['amount']
			indicator_id = indicator['indicator_id']
			office_id = indicator['office_id']
			key = ("{0}_{1}".format(office_id, indicator_id))

			#Getting indicator/office risk
			indicators_risk[key] = {
				'value': ammount,
				'percent': (ammount / totals[indicator_id]) * 100,
				'indicator_id': indicator_id,
				'office_id' : office_id 
			}

		return indicators_risk


	def get_risk(self):
		office_list = []
		regions = {}		
		category_indicators = IndicatorCategory.objects.all()
		offices_information = Dashboard.get_sql_data('call risk_information_tree()')
		office_indicator_risk = self.get_indicator_risk_by_office(offices_information)

		for office in Office.objects.all():
			category_count = 0
			categories_risk = {}
			sum_indicator_risk = 0

			office_object = {
				'risk': 0,
				'id': office.id,
				'category_risk': {},
				'code': office.code,
				'name': office.name,
				'address': office.address
			}			

			for category_indicator in category_indicators:
				key = ("{0}_{1}".format(office.id, category_indicator.indicator_id))

				if not key in office_indicator_risk:
					continue

				indicator_risk = office_indicator_risk[key]
				category_id = category_indicator.category_id
				category_indicator_risk = (indicator_risk['percent'] / 100) *  category_indicator.weight
				indicator_risk['category_risk'] = category_indicator_risk

				#Adding category indicator risk
				if category_id in categories_risk:
					categories_risk[category_id]['total_risk'] += category_indicator_risk
				else:
				#Creating new category indicator risk
					category_count = category_count + 1
					categories_risk[category_id] = {
						'id': category_id,
						'name': 'To be defined',
						'total_risk': category_indicator_risk,
						'indicators': []
					}

				categories_risk[category_id]['indicators'].append(indicator_risk.copy())
				sum_indicator_risk += category_indicator_risk				

			office_object['category_risk'] = categories_risk
			office_object['risk'] = sum_indicator_risk / category_count if category_count > 0 else 0

			office_list.append(office_object.copy())

			if office.region_id in regions:
				regions[office.region_id]['risk'] = office_object['risk']
			else:
				regions[office.region_id] = {
					'id': office.region_id,
					'name': office.region.name,
					'location': office.region.area[0].coords,
					'risk': 0
				}	

		return  {'offices': office_list, 'regions': regions}
