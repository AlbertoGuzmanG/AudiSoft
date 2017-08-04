var MapView = function(scope, object_name) {
	var current_position = {lat:0, long:0};
	var office_layer = null;

	//Setting popup 
	var container = document.getElementById('popup');
	var content = document.getElementById('ul-popup-content');
	var closer = document.getElementById('popup-closer');

	//Getting Rep. Dom. center vier
	var view = new ol.View({
          center: [-7827756.142193, 2137777.233628, -7686973.372364, 2289551.494243],
          zoom: 7,
          minZoom:8
    });
	 
	var overlay = new ol.Overlay(/** @type {olx.OverlayOptions} */ ({
		element: container,
		autoPan: true,
		autoPanAnimation: {
		  duration: 250
		}
	})); 
	
	closer.onclick = function() {
		overlay.setPosition(undefined);
		return false;
	};	

	var regions_location = {
		"type": "FeatureCollection",
		"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
		"features": scope.regions
	};

	var baseLayer = new ol.layer.Group({
	    title: 'Mapa - Banco de Reservas',
	    layers: [
			new ol.layer.Tile({
			    'title': 'BaseMap',
			    'type': 'base',
			    source: new ol.source.XYZ({
    				url: 'https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoibGRpbG9uZSIsImEiOiJjajVsZ2lvMWsydGUzMnduejlvNXNmZXpyIn0.bkr-AWvNEFwDF1vw6ZzHDw'
  				}),						   
			    opacity: 1,
			    brightness: 1.2
			})
		]
	});

	//Getting region color
	var getRegionColor = function(feature, value) {
		var regionColor = "rgba(154, 207, 145,0.64)";
		switch(value){
			case '4':
			case '10':
			case '9':
				regionColor = "rgba(217, 31, 31,0.64)";
				break;	
			case '11':
			case '6':
			case '1':
				regionColor = "rgba(250, 227, 131,0.64)";
				break;	
		}

	    return [ new ol.style.Style({
	        stroke: new ol.style.Stroke({color: "rgba(0,0,0,0.64)", lineDash: null, lineCap: 'butt', lineJoin: 'miter', width: 0}), fill: new ol.style.Fill({color: regionColor})
	    })];                
	};

	var regionalCache={}
	var regionalStyle = function(feature, resolution){
	    var value = feature.get("id");
	    var style = getRegionColor(feature, value);
	    if ("" !== null) {
	        var labelText = String("");
	    } else {
	        var labelText = ""
	    }

	    var key = value + "_" + labelText

	    if (!regionalCache[key]){
	        var text = new ol.style.Text({
	              font: '10.725px \'MS Shell Dlg 2\', sans-serif',
	              text: labelText,
	              textBaseline: "center",
	              textAlign: "left",
	              offsetX: 5,
	              offsetY: 3,
	              fill: new ol.style.Fill({
	                color: "rgba(0, 0, 0, 255)"
	              }),
	            });
	        regionalCache[key] = new ol.style.Style({"text": text})
	    }

	    var allStyles = [regionalCache[key]];
	    allStyles.push.apply(allStyles, style);
	    return allStyles;
	};

	var regionalFormat = new ol.format.GeoJSON();
	var regionalFeatures = regionalFormat.readFeatures(regions_location, 
	            											{dataProjection: 'EPSG:4326', 
	            											featureProjection: 'EPSG:3857'}
	            										);

	var jsonSource_REGIONALES = new ol.source.Vector(); 

	jsonSource_REGIONALES.addFeatures(regionalFeatures);

	var region_layer = new ol.layer.Vector({
	    source:jsonSource_REGIONALES, 
	    style: regionalStyle,
	    title: "Regionales"
	});

	var size = 0;
	var office_style={}
	var getOfficeStyle = function(feature, resolution){
	    var value = ""
	    var size = 0;
	    var style = [ new ol.style.Style({
	        image: new ol.style.Circle({radius: 8.0 + size,
	            stroke: new ol.style.Stroke({color: "rgba(0,0,0,1.0)", lineDash: null, lineCap: 'butt', lineJoin: 'miter', width: 0}), fill: new ol.style.Fill({color: "rgba(72,121,86,1.0)"})})
	    })];
	    if ("" !== null) {
	        var labelText = String("");
	    } else {
	        var labelText = ""
	    }
	    var key = value + "_" + labelText

	    if (!office_style[key]){
	        var text = new ol.style.Text({
	              font: '10.725px \'MS Shell Dlg 2\', sans-serif',
	              text: labelText,
	              textBaseline: "center",
	              textAlign: "left",
	              offsetX: 5,
	              offsetY: 3,
	              fill: new ol.style.Fill({
	                color: "rgba(0, 0, 0, 255)"
	              }),
	            });
	        office_style[key] = new ol.style.Style({"text": text})
	    }
	    var allStyles = [office_style[key]];
	    allStyles.push.apply(allStyles, style);
	    return allStyles;
	};


	var layers_list = [baseLayer, region_layer];

	var container = document.getElementById('popup');
	var content = document.getElementById('popup-content');
	var closer = document.getElementById('popup-closer');
	var overlayPopup = new ol.Overlay({
	    element: container
	});

	var expandedAttribution = new ol.control.Attribution({
	    collapsible: false
	});

	var map = new ol.Map({
	    controls: ol.control.defaults({attribution:false}).extend([
	        expandedAttribution,new ol.control.LayerSwitcher({tipLabel: "Layers"})
	    ]),
	    target: document.getElementById('map'),
	    renderer: 'canvas',
	    overlays: [overlayPopup, overlay],
	    layers: layers_list,
	    layer: 'os_licenced_background_colour',
	    view: view
	});

	$(map.getViewport()).on("dblclick", function(e) {
	    map.forEachFeatureAtPixel(map.getEventPixel(e), function (feature, layer) {

	       map.getView().setCenter( [current_position.lat, current_position.long]);
	       map.getView().setZoom(10);
	    });
	});

	map.on('singleclick', function(evt) {
		var coordinate = evt.coordinate;
	   	var pixel = map.getEventPixel(evt.originalEvent);	   	
		
	   	var mapFeature = null;
	    map.forEachFeatureAtPixel(pixel, function(feature, layer) {	    	
	        if(mapFeature == null || (feature['U'] && feature.U.info['type'])){
	        	mapFeature = feature;
	        }
	    });
	    
	    if(mapFeature != null)
	    	popup(mapFeature.U.info, coordinate);
	});

	var featureOverlay = new ol.layer.Vector({
        source: new ol.source.Vector(),
        map: map,
        style: new ol.style.Style({
          stroke: new ol.style.Stroke({
            color: '#f00',
            width: 1,
          }),
          fill: new ol.style.Fill({
            color: 'rgba(255,0,0,0.1)'
          })
        })
    });

    var highlight;
    var displayFeatureInfo = function(pixel) {
		var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
		  return feature;
		});

		var info = document.getElementById('info');

		if(feature){
			console.log(feature.U['._REGION']);        	
		}

		if (feature !== highlight) {
		  if (highlight) {
		    featureOverlay.getSource().removeFeature(highlight);
		  }

		  if (feature) {
		    featureOverlay.getSource().addFeature(feature);
		  }

		  highlight = feature;
		}
    };

	map.on('pointermove', function(evt) {
		if (evt.dragging) {
		  return;
		}

		current_position = {lat:evt.coordinate[0], long:evt.coordinate[1]};
		var pixel = map.getEventPixel(evt.originalEvent);
		//console.log(evt.coordinate);
		displayFeatureInfo(pixel);
	});

	var centerMap = function(coords, zoom) {
	    map.getView().setCenter(ol.proj.transform([coords.long, coords.lat], 'EPSG:4326', 'EPSG:3857'));
	    map.getView().setZoom(zoom);
	};

	var showRegion = function(region){

		if(office_layer){
			map.removeLayer(office_layer);
		}

		officeData = scope.offices.filter(function(e){ if(e.properties.REGION == region.name) return e});

		var offices_location = {
			"type": "FeatureCollection",
			"crs": { "type": "name", "properties": { "name": "urn:ogc:def:crs:OGC:1.3:CRS84" } },
			"features": officeData
		};

		var office_format = new ol.format.GeoJSON();
		var office_feature = office_format.readFeatures(offices_location, {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
		var offices_data_source = new ol.source.Vector();

		offices_data_source.addFeatures(office_feature);

		office_layer = new ol.layer.Vector({
	        source:offices_data_source, 
	        style: getOfficeStyle,
	        title: "Oficinas Banco de Reservas"
		});

		map.addLayer(office_layer);
		centerMap(region.center_coords, region.zoom);
	}

	var popup = function(info, location){
		var popup_content = '';

		console.log(info, location);

		for (key in info) {
			popup_content += '<li class="collection-item" ><text><b>' + info[key].label +': </b> <span>' + info[key].value +'</span></text></li>';
		}

		$('ul.collection.popup-map').html(popup_content)
		overlay.setPosition(location);
	}

	var hidePopup = function(){
		overlay.setPosition(undefined);
	}

	return {
		centerMap: centerMap,
		showRegion: showRegion,
		hidePopup: hidePopup
	}
}