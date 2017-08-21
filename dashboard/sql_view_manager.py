from pathlib import Path
from dashboard.models import Office, IndicatorCategory, Dashboard

class ViewManager:
	root_view_path = 'dashboard\\sql_views\\'

	def get_view(self, view_name, variables = {}):
		sql_file_path = self.root_view_path + view_name + '.sql'
		sql_view = Path(sql_file_path).read_text()	
		return sql_view.format(**variables)

	def get_tree_risk(self, total_record, filter = {}):
		return Dashboard.get_sql_data('call risk_information_tree(3, "")')

		