var app = angular.module('audit_soft', ['map']);

app.config(['$interpolateProvider', function($interpolateProvider) {
  $interpolateProvider.startSymbol('[[');
  $interpolateProvider.endSymbol(']]');
}]);

app.controller('navegationController', ['$scope', '$http', '$rootScope', '$q', function(scope, http, rootScope, q){
	scope.indicator_type = true;
	scope.indicator_change = function(){
		rootScope.$broadcast('indicator_type_change', scope.indicator_type);
	}
}]);

app.controller('dashboardController', ['$scope', '$http', '$rootScope', '$q', '$timeout', function(scope, http, rootScope, q, timeout){

	scope.resume_box_2 = { office : 'Isabel La Catolica 45%', category : 'Préstamos 44%', indicator : 'Deterioro de la cartera 36%' };
	scope.resume_box_1 = { office : 'Av Tiradentes 41%', category : 'Tárjetas 51%', indicator : 'Garantes de Préstamos 40%' };
	scope.resume_box = { };
	scope.settings = { indicator_type : 1};
	scope.loading = { offices : false, regions : false, categories : false};
	scope.office_modal = [{ name : 'Préstamos', percent : 50}, { name : 'Tárjetas', percent : 50}]


	scope.$on('indicator_type_change', function(event, indicator_type) {
		scope.settings.indicator_type = (indicator_type) ? 1 : 2;
		updateData();
	});

	// promises
	var getOffices = () => http.get('/api/offices');
	var getOfficesRisk = () => http.get('/dashboard/api/offices_risk/' + scope.settings.indicator_type).finally(() => loading.hide.all());

	// extract data functions
	var getCategoriesFromOffice = (office) => $.map(office.categories, function(value, index) { return [value];}); // office.categories object to array

	var getRiskyOffices = (offices) => offices.filter((o) => o.risk > 0 );

	function processResponse(values) {
		scope.offices = values[0].data;
		scope.offices_risk = values[1].data.offices_risk.offices;
		scope.resume_box = values[1].data.offices_risk.summary;

		scope.offices_risk.forEach((item) => {
			item.risk_level = universal.getLevel(item.risk);
		});
	}

	function updateData() {
		loading.show.all();
		q.all([getOffices(), getOfficesRisk()]).then(processResponse);
	}

	var loading = {
		show : {
			offices : () => scope.loading.offices = true,
			categories : () => scope.loading.categories = true,
			regions : () => scope.loading.regions = true,
			all : function() { Object.keys(this).forEach((k) => { scope.loading[k] = true})}
		},
		hide : {
			offices : () => scope.loading.offices = false,
			categories : () => scope.loading.categories = false,
			regions : () => scope.loading.regions = false,
			all : function() { Object.keys(this).forEach((k) => { scope.loading[k] = false})}
		}
	}

	updateData();

	var colors = {
		red: 'rgb(255, 99, 132)',
		orange: 'rgb(255, 159, 64)',
		yellow: 'rgb(255, 205, 86)',
		green: 'rgb(75, 192, 192)',
		blue: 'rgb(54, 162, 235)',
		purple: 'rgb(153, 102, 255)',
		grey: 'rgb(201, 203, 207)'
	};

	var transparentize = function(color, opacity) {
		var alpha = opacity === undefined? 0.5 : 1 - opacity;
		return Chart.helpers.color(color).alpha(alpha).rgbString();
	}


}]);