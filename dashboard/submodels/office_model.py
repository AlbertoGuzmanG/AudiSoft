# from django.db import models
from dashboard.models import Office, IndicatorCategory, Dashboard
from dashboard.sql_view_manager import ViewManager
from pprint import pprint

class OfficeModel():
	indicator_type = 0

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


	def get_risk(self, indicator_type):
		regions = {}
		office_list = []
		executions_count = 3 #TODO get this value from config

		self.indicator_type = indicator_type
		#Getting category indicatos by indicator type
		category_indicators = IndicatorCategory.objects.all().filter(indicator_type_id = self.indicator_type)
		#Getting indicators data from las N executions
		offices_information = ViewManager().get_tree_risk(executions_count, {'indicator_type' : self.indicator_type})

		#Grouping information by indicator and office
		office_indicator_risk = self.get_indicator_risk_by_office(offices_information)

		for office in Office.objects.all():
			category_count = 0
			categories_risk = {}
			sum_indicator_risk = 0

			office_object = {
				'risk': 0,
				'id': office.id,
				'categories': {},
				'code': office.code,
				'name': office.name,
				'address': office.address,
				'schedule': office.schedule,
				'region': office.region.name,
				'location': office.location,
				'type': office.office_type,
			}

			for category_indicator in category_indicators:
				key = ("{0}_{1}".format(office.id, category_indicator.indicator_id))

				if not key in office_indicator_risk:
					continue

				indicator_risk = office_indicator_risk[key]
				category_id = category_indicator.category_id

				#Getting category weight by indicator type
				category_weight = (category_indicator.category.categoryweight_set.filter(indicator_type_id = self.indicator_type).values()[0])['weight']
				#Calculating category indicator risk
				category_indicator_risk = (indicator_risk['percent'] / 100) *  category_indicator.weight
				#Calculating weight risk for indicators
				indicator_risk['weight_risk'] = category_indicator_risk
				#Calculating weight risk for categories
				weight_risk = (category_indicator_risk / 100) * category_weight

				#Adding category indicator risk
				if category_id in categories_risk:
					categories_risk[category_id]['partial_risk'] += category_indicator_risk
					categories_risk[category_id]['weight_risk'] +=  weight_risk
				else:
				#Creating new category indicator risk
					categories_risk[category_id] = {
						'id': category_id,
						'name': category_indicator.category.name,
						'partial_risk': category_indicator_risk,
						'weight_risk': weight_risk,
						'indicators': []
					}

				categories_risk[category_id]['indicators'].append(indicator_risk.copy())
				sum_indicator_risk += weight_risk

			office_object['categories'] = categories_risk
			office_object['risk'] = sum_indicator_risk

			office_list.append(office_object.copy())

			if office.region_id in regions:
				regions[office.region_id]['risk'] += office_object['risk']
			else:
				regions[office.region_id] = {
					'id': office.region_id,
					'name': office.region.name,
					'location': office.region.area[0].coords if office.region.area else '',
					'risk': office_object['risk']
				}

		return  {'offices': office_list, 'regions': regions}
