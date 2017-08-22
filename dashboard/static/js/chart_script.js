/* Initial Data */
var monthsLabels = ["ENE","FEB","MAR","ABR","MAY","JUN","JUL", "AGO", "SEP", "OCT", "NOV", "DIC"];
var initialMonthLabels = monthsLabels.slice(0,7); // default show first 7 months
Chart.defaults.global.defaultFontColor = "#fff";


var revenueSelectize = $('#select-state').selectize({maxItems: 3});

debugger;
    // items : [],
    // onItemAdd : selectizeItemAddHandler,
    // onItemRemove : selectizeItemRemoveHandler

function addData(chart, label, data) {
    chart.data.labels.push(label);
    chart.data.datasets.forEach((dataset) => {
        dataset.data.push(data);
    });
    chart.update();
}

function removeData(chart) {
    chart.data.labels.shift();
    chart.data.datasets.forEach((dataset) => {
        dataset.data.shift();
    });
    chart.update();
}


$.get('/dashboard/demo')
.success(function (response) {
	officesRiskChart(response);
});


/* Trending Line Chart */

function officesRiskChart(chartData) {
	var trendingLineChartCtx = document.getElementById("trending-line-chart").getContext("2d");
	var trendingLineChar = new Chart(trendingLineChartCtx, {
	    type: 'line',
	    data: {labels : initialMonthLabels, datasets : [] },
	    options: {
	        fontColor : 'white',
	        tooltips : {
				events : ["mousemove", "touchstart", "touchmove"],
				backgroundColor : "rgba(255,255,255,0.8)",
				fontSize : 12,
				bodyFontColor : "#000",
				titleFontFamily : "'Roboto','Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
				titleFontSize : 14,
				titleFontStyle : "bold",
				titleFontColor : "#000",
				yPadding : 8,
				xPadding : 16,
				caretSize : 10,
				cornerRadius : 6,
				xOffset : 10	
	        },
	        scaleLabel : {
	            xAxes : [{
	                labels : {display : false }
	            }]
	        },
	        scales: {
	            yAxes: [{
	                gridLines: {
	                    color: 'rgba(255,255,255,0.4)'
	                }
	            }],
	            xAxes: [{
	                gridLines: {
	                    display: false
	                }
	            }]
	        },
	        legend: {
	            display: false,
	            labels: {
	                fontColor: 'white'
	            }
	        }
	    }
	});

	var initialData = chartData.slice(0,3); // graph first three offices
	var selectizeInitialData = initialData.map(dataset => dataset.code);

	// var l = 7;
	// setInterval(function () {
	// 	var x = Math.floor(Math.random() * (500 - 10 + 1)) + 10;
	// 	addData(trendingLineChar, monthsLabels[l], x);
	// 	removeData(trendingLineChar);

	// 	if (l++ == monthsLabels.length - 1)
	// 		l = 0;
	// }, 1000);

	var addOfficeColor = function (office) {
		var officeColors = [
			{
		        backgroundColor : "rgba(27,133,184, 0.3)",
		        borderColor :  "rgba(255,255,255,0.8)",
		        pointBackgroundColor : "#00bcd4",
		        pointBorderColor : "#fff",
		        pointHoverBackgroundColor : "#80deea",
		        pointHoverBorderColor : "#80deea"
			},{
		        backgroundColor : "rgba(133,184,133, 0.3)",
		        borderColor :  "rgba(255,255,255,0.8)",
		        pointBackgroundColor : "#00bcd4",
		        pointBorderColor : "#fff",
		        pointHoverBackgroundColor : "#deea80",
		        pointHoverBorderColor : "#deea80"
			},
			{
		        backgroundColor : "rgba(128, 222, 234, 0.3)",
		        borderColor :  "rgba(255,255,255,0.8)",
		        pointBackgroundColor : "#00bcd4",
		        pointBorderColor : "#ffffff",
		        pointHoverBackgroundColor : "#ffffff",
		        pointHoverBorderColor : "#ffffff"
			}
		]; // TO DEFINE
        var chartLength = trendingLineChar.chart.data.datasets.length;

        office.pointHoverBackgroundColor = officeColors[chartLength].pointHoverBackgroundColor;
        office.pointHoverBorderColor = officeColors[chartLength].pointHoverBorderColor;
        office.pointBackgroundColor = officeColors[chartLength].pointBackgroundColor;
        office.backgroundColor = officeColors[chartLength].backgroundColor;
        office.pointBorderColor = officeColors[chartLength].pointBorderColor;
        office.borderColor = officeColors[chartLength].borderColor;

        office.pointHitRadius = 25;
        office.pointRadius = 5;

        return office;
	}

    // display or hide offices on risk chart
    var selectizeItemAddHandler = function (value, element) {
        var officeIndex = window.dataSet.map(a => a.code).indexOf(value);
        var officeItem = window.dataSet[officeIndex];

		// Add Office color
		officeItem = addOfficeColor(officeItem);

        trendingLineChar.chart.data.datasets.push(officeItem);
        trendingLineChar.update();
    }

    // display or hide offices on risk chart
    var selectizeItemRemoveHandler = function (value, element) {
        var officeIndex = trendingLineChar.chart.data.datasets.map(a => a.code).indexOf(value);
        trendingLineChar.chart.data.datasets.splice(officeIndex, 1);
        trendingLineChar.update();
    }

	// hide/show selectize control on filter btn click
    $('#filter-btn').on('click', function () {
        $('.selectize-control').fadeToggle();
    })


    // on load, hide selectize control
    // $('.selectize-control').hide();

    // add initial data to trendingLineChar
    for(var i in initialData) {
    	var office = initialData[i];
        trendingLineChar.chart.data.datasets.push(addOfficeColor(office));
    }

    trendingLineChar.update();
}



/* Indicadores Criticos */
var labels = ["Indicador 1", "Indicador 2", "Indicador 3", "Indicador 4", "Indicador 5", "Indicador 6", "Indicador 7"];
var dataset = [65, 59, 80, 81, 56, 55, 40];
function loadCriticalIndicatorsChart(labels, dataset) {

	var criticalIndicatorsChartCtx = document.getElementById("top-indicadores-incidencias").getContext("2d");
	var criticalIndicatorsChart = new Chart(criticalIndicatorsChartCtx, {
	        type: 'bar',
	        data:  {
		        labels: labels,
		        datasets : [{
		            "label": "My First Dataset",
		            "data": dataset,
		            "fill": false,
		            "backgroundColor": "rgba(128, 222, 234, 0.2)",
		            "borderColor": "rgb(128, 222, 234)",
		            "borderWidth": 1
		        }]
		    },
		    options: { legend : { display : false }, scales: {yAxes: [{ticks: {beginAtZero: true } }]}}
	});
}

loadCriticalIndicatorsChart(labels)