from pathlib import Path
from dashboard.models import Office, IndicatorCategory, Dashboard

class ViewManager:
	root_view_path = 'dashboard\\sql_views\\'

	def get_view(self, view_name, variables = {}):
		sql_file_path = self.root_view_path + view_name + '.sql'
		sql_view = Path(sql_file_path).read_text()       
		return sql_view.format(**variables)

	def get_tree_risk(self, total_records, filter = {}):
		query_string = ''

		if 'date' in filter and 'from' in filter['date']:
			query_string += " load_date >= '{0}' ".format(filter['date']['from'])

		if 'date' in filter and 'to' in filter['date']:
			query_string += " load_date <= '{0}' ".format(filter['date']['to'])

		return Dashboard.get_sql_data('call risk_information_tree({0},"{1}")'.format(total_records, query_string))

		