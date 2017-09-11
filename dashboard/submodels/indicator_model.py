# from django.db import models
from dashboard.models import Office, IndicatorCategory, Dashboard
from dashboard.sql_view_manager import ViewManager

class OfficeModel():

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
			risk_percent = (ammount / totals[indicator_id]) * 100

			if indicator_id in indicators_risk:
				indicators_risk[indicator_id]['percent'] += total_risk
			else:
				#Getting indicator/office risk
				indicators_risk[indicator_id] = {
					'value': ammount,
					'percent': total_risk,
					'indicator_id': indicator_id,
					'office_id' : office_id
				}

		return indicators_risk

	def get_risk(self, total_executions, indicator_type, filter):


