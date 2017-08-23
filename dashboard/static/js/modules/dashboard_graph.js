var app = angular.module('audit_soft', []);

app.config(['$interpolateProvider', function($interpolateProvider) {
  $interpolateProvider.startSymbol('[[');
  $interpolateProvider.endSymbol(']]');
}]);

app.controller('dashboardController', ['$scope', '$http', function($scope, $http){

	$scope.settings = { by_amount : true}

	getOffices().then(()=>{
		fillSelectizeOfficesControl();
		getTrendingLineCharData();
	});

	function getOffices() {
		return $http.get('/api/offices')
			.then((response) => {
				$scope.offices = response.data;
			});
	}

	function getTrendingLineCharData() {
		fillTrendingLineChar();
	}

	function loadAllGraphData() {
		
	}

	function fillSelectizeOfficesControl() {
		var selectize = $('#select-state')[0].selectize;

		$scope.offices.forEach((office) =>{
			selectize.addOption({ value : office.code, text : office.name});
		});
	}

	function fillTrendingLineChar() {
		officesRiskChart([{ label: "Isabel La Catolica", code : "10", data: [190, 46, 2, 138, 196, 155, 168] },
			{ label: "Independencia", code : "11", data: [67, 133, 17, 67, 26, 175, 8] },
			{ label: "Aeropuerto", code : "12", data: [11, 130, 159, 3, 36, 32, 134] },
			{ label: "Maximo Gomez", code : "13", data: [81, 48, 135, 94, 135, 176, 28] },
			{ label: "Padre Castellanos", code : "15", data: [170, 197, 71, 113, 200, 198, 143] },
			{ label: "Los Mina", code : "16", data: [61, 198, 153, 183, 48, 77, 133] },
			{ label: "Las Americas", code : "17", data: [143, 94, 108, 83, 6, 169, 68] },
			{ label: "Ave. Mella", code : "20", data: [116, 125, 105, 152, 41, 136, 70] },
			{ label: "Ave. Duarte", code : "21", data: [135, 73, 46, 17, 191, 76, 110] },
			{ label: "Eusebio Manzueta", code : "22", data: [15, 119, 22, 28, 30, 113, 36] },
			{ label: "Ave. Mexico", code : "23", data: [14, 85, 145, 182, 121, 145, 9] },
			{ label: "Ave. San Martin", code : "30", data: [188, 196, 95, 97, 19, 96, 133] },
			{ label: "Nicolas de Ovando", code : "31", data: [109, 139, 45, 197, 143, 126, 58] },
			{ label: "Monte Plata", code : "32", data: [9, 47, 105, 53, 3, 74, 136] },
			{ label: "Villa Mella", code : "33", data: [189, 110, 5, 90, 41, 198, 108] },
			{ label: "Barahona", code : "40", data: [116, 3, 87, 84, 91, 79, 106] },
			{ label: "Pedernales", code : "41", data: [108, 101, 111, 95, 135, 103, 78] },
			{ label: "Jimani", code : "44", data: [126, 176, 115, 98, 196, 13, 199] },
			{ label: "Neyba", code : "45", data: [121, 77, 114, 182, 122, 112, 85] },
			{ label: "La Vega Real", code : "50", data: [121, 15, 191, 59, 169, 104, 170] },
			{ label: "Jarabacoa", code : "51", data: [60, 148, 3, 136, 93, 35, 196] },
			{ label: "Constanza", code : "52", data: [19, 5, 147, 73, 37, 28, 52] }]);
	}
}]);