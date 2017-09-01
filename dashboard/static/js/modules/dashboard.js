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
		scope.office_risk = values[1].data;

		scope.resume_box.offices = setOfficesRiskData(scope.office_risk);
		scope.resume_box.categories = setCategoriesData(scope.office_risk);
	}

	function setCategoriesData(offices_risk) {

		offices_risk = getRiskyOffices(offices_risk.offices);
		var category_sum = [];

		offices_risk.forEach(office => {
			var categories = getCategoriesFromOffice(office);
			var total_amount = 0;

			categories.forEach((category) => {
				var indicators = [];
				category.indicators.forEach((indicator) => {
					if (indicators.map(a => a.indicator_id).indexOf(indicator.indicator_id) == -1) {
						indicators.push(indicator);
					}
				});
				category.total_amount = indicators.map(a => a.value).reduce((a,b) => a + b)
			});

			categories.forEach(category => {
				var category_index = category_sum.map(a => a.id).indexOf(category.id);
				if (category_index == -1) {
					category_sum.push(category);
				} else {
					category_sum[category_index].total_amount += category.total_amount;
				}
			});
		});
		return category_sum;
	}

	function setOfficesRiskData(offices_risk) {

		var office_risk = getRiskyOffices(offices_risk.offices);
		office_risk.forEach(office => {
			office.total_amount = totalizeIncidencesAmountByOffice(office)
			office.risk_level = universal.getLevel(office.risk);
		});
		office_risk = office_risk.sort((a,b) => a.risk < b.risk).splice(0, 5);
		return office_risk;
	}

	function totalizeIncidencesAmountByOffice(office) {
		// by office, get the total of an indicator,
		// could be by either qty or amount depending on the settings

		var categories =  getCategoriesFromOffice(office);
		var total_amount = 0;
		var indicators = [];

		categories.forEach((category) => {
			category.indicators.forEach((indicator) => {
				if (indicators.map(a => a.indicator_id).indexOf(indicator.indicator_id) == -1) {
					indicators.push(indicator);
				}
			});
		});

		var total_amount = indicators.map(a => a.value).reduce((a,b) => a + b)
		return total_amount;
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

	new Chart(document.getElementById("line-chart-sample"), {
	    type: 'bar',
	    data: {
	      labels: ['Préstamos','Cuentas de ahorro','Tárjetas de crédito','Certificado'],
	      datasets: [
	        {
	          label: "",
	          backgroundColor: [transparentize(colors.red, .3), transparentize(colors.blue, .3),transparentize("#3cba9f", .3),transparentize("#e8c3b9", .3),transparentize("#c45850", .3)],
	          data: [2478,5267,734,784,433]
	        }
	      ]
	    },
	    options: {
			legend: {
	            display:false,
	        labels: {
	            fontColor: "#f00",
	            fontSize: 18
	        }},
	      title: {
	        display: false,
	        text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});


	 new Chart(document.getElementById("doughnut-chart"), {
	    type: 'doughnut',
	    data: {
	      labels: ['METROPOLITANA NORTE', 'METROPOLITANA CENTRAL', 'METROPOLITANA OESTE', 'METROPOLITANA ORIENTAL', 'ZONA ESTE', 'ZONA SANTIAGO ESTE', 'ZONA SANTIAGO OESTE', 'ZONA NORCENTRAL', 'ZONA NORDESTE', 'ZONA NOROESTE', 'ZONA SURESTE', 'SUR'],
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: [transparentize("#3e95cd", .3), transparentize("#8e5ea2", .3),transparentize("#3cba9f", .3),transparentize("#e8c3b9", .3),transparentize("#c45850", .3),transparentize('#929AE0', .3), transparentize('#23BB6F', .3), transparentize('#050C3D', .3), transparentize('#DCB7E5', .3), transparentize('#60FEE7', .3), transparentize('#B033F7', .3), transparentize('#04140C', .3)],
	          data: [2289, 1904, 1720, 270, 790, 2795, 1620, 1729, 1176, 1739, 1228, 2273]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: false
	        // text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});

}]);