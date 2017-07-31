(function(){
	var app = angular.module('audit_soft', []);

	app.controller('map', ['$scope', function(scope){
		//Getting the map
		var map_view = new MapView(scope);		
		var polarChartCountry = document.getElementById("polar-chart-country").getContext("2d");

		var randomScalingFactor = function() {
	        return Math.round(Math.random() * 100);
	    };

	    var chartColors = window.chartColors;
	    var color = Chart.helpers.color;
	    var config = {
	        data: {
	            datasets: [{
	                data: [
	                    10,
	                    20,
	                    40,
	                    50,
	                    80,
	                    10,
	                    20,
	                    40,
	                    50,
	                    80,
	                    20                    
	                ],
	                backgroundColor: [
	                    '#ce93d8',
	                    '#009688',
	                    '#FF5A5E',
	                    '#4caf50',
	                    '#80cbc4',
	                    '#ce93d8',
	                    '#009688',
	                    '#7986cb',
	                    '#4caf50',
	                    '#90caf9',
	                    '#80cbc4',

	                ],
	                label: 'My dataset' // for legend
	            }],
	            labels: [
					'METROPOLITANA CENTRAL',
					'METROPOLITANA OESTE',
					'METROPOLITANA ORIENTAL',
					'ZONA ESTE',
					'ZONA SANTIAGO ESTE',
					'ZONA SANTIAGO OESTE',
					'ZONA NORCENTRAL',
					'ZONA NORDESTE',
					'ZONA NOROESTE',
					'ZONA SURESTE',
					'ZONA SUROESTE',
	            ],
	            ids: [
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10,
					11
	            ]            
	        },
	        options: {
	            responsive: true,
	             type: 'pie',
	            legend: {
	                position: 'right',
	            },
	            scale: {
	              ticks: {
	                beginAtZero: true
	              },
	              reverse: false
	            },
	            animation: {
	                animateRotate: true,
	                animateScale: true
	            },
	            onClick:function(evt, elem){

	            }
	        }
	    };

	    window.myPolarArea = Chart.PolarArea(polarChartCountry, config);

	}]);

})()
