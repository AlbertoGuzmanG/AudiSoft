var app = angular.module('audit_soft', ['map']);

app.config(['$interpolateProvider', function($interpolateProvider) {
  $interpolateProvider.startSymbol('[[');
  $interpolateProvider.endSymbol(']]');
}]);

app.controller('navegationController', ['$scope', '$http', '$rootScope', '$q', function(scope, http, rootScope, q){
	scope.indicator_change = function(){
		rootScope.$broadcast('indicator_type_change', scope.indicator_type);
	}
}]);

app.controller('dashboardController', ['$scope', '$http', '$rootScope', '$q', '$timeout', function(scope, http, rootScope, q, timeout){

	scope.resume_box = {};
	scope.settings = { indicator_type : 1};
	scope.loading = { offices : false, regions : false, categories : false};

	var getOffices = () => http.get('/api/offices');
	var getOfficesRisk = () => http.get('/dashboard/api/offices_risk/' + scope.settings.indicator_type).finally(() => loading.hide.all());

	scope.$on('indicator_type_change', function(event, indicator_type) {
		scope.settings.indicator_type = (indicator_type) ? 1 : 2;
		updateData();
	});

	var getCategoriesFromOffice = (office) => $.map(office.categories, function(value, index) { return [value];}); // office.categories object to array

	var processResponse = function (values) {
		scope.offices = values[0].data;
		scope.office_risk = values[1].data;

		scope.resume_box.offices = setOfficesRiskData(scope.office_risk);
		scope.resume_box.categories = setCategoriesData(scope.office_risk);
	}

	function setCategoriesData(offices_risk) {
		offices_risk = offices_risk.offices.filter((a) => a.risk > 0 );
		var category_sum = [];

		offices_risk.forEach(office => {
			var categories = getCategoriesFromOffice(office);
			var total_incidences = 0;

			categories.forEach((category) => {
				var indicators = [];
				category.indicators.forEach((indicator) => {
					if (indicators.map(a => a.indicator_id).indexOf(indicator.indicator_id) == -1) {
						indicators.push(indicator);
					}
				});
				category.total_incidences = indicators.map(a => a.value).reduce((a,b) => a + b)
			});


			categories.forEach(category => {
				var category_index = category_sum.map(a => a.id).indexOf(category.id);
				if (category_index == -1) {
					category_sum.push(category);
				} else {
					category_sum[category_index].total_incidences += category.total_incidences;
				}
			});
		});
		return category_sum;
	}

	function setOfficesRiskData(offices_risk) {

		var office_risk = offices_risk.offices.filter((a) => a.risk > 0 );
		office_risk.forEach(office => {
			office.total_incidences = totalizeIncidencesByOffice(office)
			office.risk_level = universal.getLevel(office.risk);
		});
		office_risk = office_risk.sort((a,b) => a.risk < b.risk).splice(0, 5);
		return office_risk;
	}

	function totalizeIncidencesByOffice(office) {

		var categories =  getCategoriesFromOffice(office);
		var total_incidences = 0;
		var indicators = [];

		categories.forEach((category) => {
			category.indicators.forEach((indicator) => {
				if (indicators.map(a => a.indicator_id).indexOf(indicator.indicator_id) == -1) {
					indicators.push(indicator);
				}
			});
		});

		var total_incidences = indicators.map(a => a.value).reduce((a,b) => a + b)
		return total_incidences;
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
	      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
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
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: [transparentize("#3e95cd", .3), transparentize("#8e5ea2", .3),transparentize("#3cba9f", .3),transparentize("#e8c3b9", .3),transparentize("#c45850", .3)],
          data: [2478,5267,734,784,433]
        }
      ]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

}]);