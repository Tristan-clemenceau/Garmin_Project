using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Sensor;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time.Gregorian;

class UserView extends WatchUi.View {

      var labelInfo,labelLigne01,labelLigne02,labelLigne03;
      var objectifQuotidien;
      var jour = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
     
     function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.user(dc));
    }

    function onShow() {
    }

    function onUpdate(dc) {
        define();
        
        labelInfo = View.findDrawableById("lblinfo");
        labelLigne01 = View.findDrawableById("lbl_ligne01");
        labelLigne02 = View.findDrawableById("lbl_ligne02");
        labelLigne03 = View.findDrawableById("lbl_ligne03");
        
        labelInfo.setText("Missions");
        labelLigne01.setText("Objectif du jour : "+ objectifQuotidien.toString()+" pas");
        labelLigne02.setText(avancement());
        labelLigne03.setText(" objectif attient a "+pourcentage().toString()+" %");
       
        View.onUpdate(dc);
    }

    function define(){
    	if(jour.day_of_week == 4){
    		objectifQuotidien = 12000;
    	}else if(jour.day_of_week == 6){
    		objectifQuotidien = 20000;
    	}else{
    		objectifQuotidien = 10000;
    	}
    }
    
    function pourcentage(){
    	return ((ActivityMonitor.getInfo().steps * 100)/objectifQuotidien);
    }
    
    function avancement(){
    var msgTemp = "";
    	if(ActivityMonitor.getInfo().steps < (objectifQuotidien/2)){
    		msgTemp="Courage tu es presque \n a la moitiee";
    	}else if(ActivityMonitor.getInfo().steps > (objectifQuotidien/2) && ActivityMonitor.getInfo().steps < objectifQuotidien){
    		msgTemp="Courage tu es presque \n a la fin";
    	}else{
    		msgTemp="OUaahh tu as depasse \n l'objectif";
    	}
    	return msgTemp;
    }
    
    function onHide() {
    }
    

}
