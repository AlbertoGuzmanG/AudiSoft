from pathlib import Path

class ViewManager():
	root_view_path = 'dashboard\\sql_views\\'

	def get_view(self, view_name, variables = {}):
		sql_file_path = self.root_view_path + view_name + '.sql'
		sql_view = Path(sql_file_path).read_text()	
		print(sql_view)
		return sql_view.format(**variables)
