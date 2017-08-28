var app = angular.module('audit_soft', ['map']);

app.config(['$interpolateProvider', function($interpolateProvider) {
  $interpolateProvider.startSymbol('[[');
  $interpolateProvider.endSymbol(']]');
}]);

app.controller('dashboardController', ['$scope', '$http', '$rootScope', function(scope, http, rootScope){

	scope.indicator_change = function(){
		rootScope.$broadcast('indicator_type_change', scope.indicator_type);
	}

	getOffices().then(loadGraphs);

	function getOffices() {
		return http.get('/api/offices')
			.then((response) => {
				scope.offices = response.data;
			});
	}

	function getTrendingLineCharData() {
		fillTrendingLineChar();
	}

	function loadGraphs(){
		fillSelectizeOfficesControl();
		getTrendingLineCharData();
	}

	function fillSelectizeOfficesControl() {
		var selectize = $('#select-state')[0].selectize;

		scope.offices.forEach((office) =>{
			selectize.addOption({ value : office.code, text : office.name});
		});
	}


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