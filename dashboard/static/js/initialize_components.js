/* Initial Data */
var monthsLabels = ["ENE","FEB","MAR","ABR","MAY","JUN","JUL", "AGO", "SEP", "OCT", "NOV", "DIC"];
var initialMonthLabels = monthsLabels.slice(0,7); // default show first 7 months
Chart.defaults.global.defaultFontColor = "#fff";

var revenueSelectize = $('#select-state').selectize({maxItems: 3, items: ['10']});

// hide/show selectize control on filter btn click
$('#filter-btn').on('click', function () {
    $('.selectize-control').fadeToggle();
});
// on load, hide selectize control
// $('.selectize-control').hide();

var trendingLineChartCtx = document.getElementById("trending-line-chart").getContext("2d");
trendingLineChar = new Chart(trendingLineChartCtx, {
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

function officesRiskChart(chartData) {

	var initialData = chartData.slice(0,3); // graph first three offices
	var selectizeInitialData = initialData.map(dataset => dataset.code);


	var addOfficeBehavior = function (office) {
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
			}]; // TO DEFINE

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
        var officeIndex = chartData.map(a => a.code).indexOf(value);
        var officeItem = chartData[officeIndex];

		// Add Office color
		officeItem = addOfficeBehavior(officeItem);

        trendingLineChar.chart.data.datasets.push(officeItem);
        trendingLineChar.update();
    }

    // display or hide offices on risk chart
    var selectizeItemRemoveHandler = function (value, element) {
        var officeIndex = trendingLineChar.chart.data.datasets.map(a => a.code).indexOf(value);
        trendingLineChar.chart.data.datasets.splice(officeIndex, 1);
        trendingLineChar.update();
    }

	revenueSelectize[0].selectize.on('item_add', selectizeItemAddHandler);
	revenueSelectize[0].selectize.on('item_remove', selectizeItemRemoveHandler);

    // add initial data to selectize component
	selectizeInitialData.forEach((item) => {
		revenueSelectize[0].selectize.addItem(item);
	});
}


