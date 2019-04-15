using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Sensor;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time.Gregorian;

class StatsView extends WatchUi.View {

  var labelTest;
  var labelStep;
  var labelHeart;
  var labelCalories;
  var nbPasActuel;
  var lastStep = ActivityMonitor.getInfo().steps;
  var rythmeCar= "";
  var jour = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
  var distance;

  function initialize() {
        View.initialize();
        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method(:onSensor));
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.StatsLayout(dc));
    }

    function onShow() {
    }

    function onUpdate(dc) {
        
        labelTest = View.findDrawableById("name");
        labelStep = View.findDrawableById("Steps");
        labelHeart = View.findDrawableById("HeartRate");
        labelCalories = View.findDrawableById("Calories");
       
        refresh();
        View.onUpdate(dc);
    }
    
	function onSensor(sensorInfo) {
		if(sensorInfo.heartRate == null){
			rythmeCar ="0";
			labelHeart.setText(rythmeCar);
		}else{
			rythmeCar = sensorInfo.heartRate.toString();
			labelHeart.setText(rythmeCar);
		}
		refresh();
		WatchUi.requestUpdate();
	}
	
    function refresh(){
    
    	nbPasActuel = ActivityMonitor.getInfo().steps;
    	distance = (nbPasActuel * 0.80)/1000;
     	
        labelTest.setText("Statistiques");
        labelCalories.setText(calculateCal().toString()+" Kcal");
        labelStep.setText(nbPasActuel.toString()+" / " + distance.toNumber().toString() + " Km");
        
        if(lastStep != nbPasActuel){
        	makeRequest();
        	lastStep = nbPasActuel;
        }
        
    }
    
    function makeRequest() {  		
       	var url = WatchUi.loadResource(Rez.Strings.url_Serveur);	// set the url
		       	
       	var params = {                                              
              "nbPasActuel" => nbPasActuel.toString(),
              "heartRate" => rythmeCar,
              "calories" => calculateCal().toString(),
              "date" => jour.day.toString()+"/"+jour.month.toString()+"/"+jour.year.toString()+"-"+System.getClockTime().hour.toString()+":"+System.getClockTime().min.toString()+":"+System.getClockTime().sec.toString()
       	};
       	
        var headers = {
          "Content-Type" => Communications.REQUEST_CONTENT_TYPE_JSON,
          // accept responses that are reported as json-compatible
          "Accept" => "application/json" 
        };
        var options = {
          :method => Communications.HTTP_REQUEST_METHOD_POST,
          :headers => headers,
          :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };
       // Make the Communications.makeWebRequest() call
       Communications.makeWebRequest(url, params, options, method(:onReceive));
	}
  
  	// set up the response callback function
	function onReceive(responseCode, data) {
	
		if (responseCode == 200) {
                 labelCalories.setText("Ok");              // print success
       	}
       	else {
           labelCalories.setText("pas Ok");            // print error
       	}

	}
	
	function calculateCal(){
		return ((nbPasActuel * 33)/1000);
	}
    
    
    function onHide() {
    }

}
