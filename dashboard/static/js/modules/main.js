(function(){
	angular.module('map', [])
	.controller('map_view', ['$scope', '$http', function(scope, http){

		var loading = {
			show : function() { scope.loading = true},
			hide : function() { scope.loading = false}
		};

		var load_map = function(data){
			scope.offices = data.offices;
			scope.regions = data.regions;

			//Getting the map
			var regions_data = [
				{name: 'METROPOLITANA CENTRAL', color: '#ce93d8', value: 10, center_coords: {lat:18.472467, long:-69.925593}, zoom: 13},
				{name: 'METROPOLITANA OESTE', color: '#007688', value: 20, center_coords: {lat: 18.594692, long: -70.033461}, zoom: 11},
				{name: 'METROPOLITANA NORTE', color: '#004688', value: 20, center_coords: {lat:18.855471, long:-69.750748}, zoom: 10},
				{name: 'METROPOLITANA ORIENTAL', color: '#FF5A5E', value: 40, center_coords: {lat:18.526996, long:-69.742857}, zoom: 11},
				{name: 'ZONA ESTE', color: '#edaf30', value: 50, center_coords: {lat:18.838941, long:-68.794927}, zoom: 9},
				{name: 'ZONA SANTIAGO ESTE', color: '#80cbc4', value: 80, center_coords: {lat:19.538509, long:-70.726169}, zoom: 11},
				{name: 'ZONA SANTIAGO OESTE', color: '#cd23d8', value: 10, center_coords: {lat: 19.290608, long: -70.921437}, zoom: 10},
				{name: 'ZONA NORCENTRAL', color: '#009688', value: 45, center_coords: {lat:18.987126, long:-70.527144}, zoom: 9},
				{name: 'ZONA NORDESTE', color: '#7986cb', value: 40, center_coords: {lat:19.411188, long:-70.038893}, zoom: 9},
				{name: 'ZONA NOROESTE', color: '#4caf50', value: 50, center_coords: {lat:19.673018, long:-71.119545}, zoom: 9},
				{name: 'ZONA SURESTE', color: '#90caf9', value: 80, center_coords: {lat: 18.564102, long: -70.500380}, zoom: 10},
			];

			//Showing the map
			scope.regions_data = regions_data;
			var map_view = new MapView(scope);

			scope.goHome = map_view.goHome;
			//Building map regions
			var object_name = 'polar-chart-country';
			var regions_char_object = document.getElementById(object_name).getContext("2d");

			var regions_chart_structure = {names: [], colors: [], values: []};
			for (var i = 0; i < regions_data.length; i++) {
				var record = regions_data[i];
				regions_chart_structure.names.push(record.name);
				regions_chart_structure.colors.push(record.color);
				regions_chart_structure.values.push(record.value);
			};

		    var config = {
		        data: {
		            datasets: [{
		                data: regions_chart_structure.values,
		                backgroundColor: regions_chart_structure.colors,
		            }],
		            labels: regions_chart_structure.names
		        },
		        options: {
		            responsive: true,
		             type: 'pie',
		            legend: {
		                position: 'left',
		            },
		            scale: {
		              ticks: {
		                beginAtZero: false
		              },
		              reverse: false
		            },
		            animation: {
		                animateRotate: true,
		                animateScale: true
		            },
		            onClick:function(evt, elem){
		            	var region_name = elem[0] ? elem[0]._model.label : (elem ? elem.text : null);
		            	if(region_name){
		            		var region = (regions_data.filter(function(e){ if(e.name == region_name) return e}))[0];
		            		map_view.hidePopup();
		            		map_view.showRegion(region);
		            	}
		            }
		        }
		    };

		    scope.region_chart = Chart.PolarArea(regions_char_object, config);
		}

		var updateMap = function(indicator_type){
			loading.show();
			http.get('/dashboard/api/map_offices_risk/' + indicator_type, {})
			.then(function (res) {
				load_map(res.data);
				$('#popup').show();
			})
			.catch(function (error) {
				console.log('Error trying to load map data');
			})
			.finally(function () {loading.hide();})
		}

		scope.$on('indicator_type_change', function(event, indicator_type) {
			$('#map').html('<div id="popup" class="ol-popup"><a href="#" id="popup-closer" class="ol-popup-closer"></a><div id="popup-content"> <ul class="collection popup-map"></ul></div></div>');
			$('#popup').hide();
			updateMap(indicator_type ? 2 : 1);
		});

		updateMap(1);
	}]);

})()
