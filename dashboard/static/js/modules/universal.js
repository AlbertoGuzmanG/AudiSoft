universal = {};

universal.getLevel = function(value){
	values = {low: 30, medium: 55, high: 100};
	for(var level in values){
		if(value <= values[level])
			return level;
	}
}


universal.colors = {low: "rgba(154, 207, 145,0.64)", medium:"rgba(250, 227, 131,0.64)", high: "rgba(217, 31, 31,0.64)"};

