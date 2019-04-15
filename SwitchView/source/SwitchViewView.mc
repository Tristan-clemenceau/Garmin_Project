using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time.Gregorian;

class SwitchViewView extends WatchUi.View {

	var timer;
	var jour;
	var labelDay;
	var pourcentageBat;
	var stats;
	var view;
	var clock;
	var nbPasActuel;
	var step;
	var image;

    function initialize() {
        View.initialize();
        timer = new Timer.Timer();
        timer.start(method(:refresh), 1000, true);
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() {
    	
    	labelDay =View.findDrawableById("lblday");
     	pourcentageBat = View.findDrawableById("battery");
     	view = View.findDrawableById("lblTime");
        step = View.findDrawableById("lblStep");
        image = View.findDrawableById("feet");
        
        refresh();
    
    }

    function onUpdate(dc) {
    
     	labelDay =View.findDrawableById("lblday");
     	pourcentageBat = View.findDrawableById("battery");
     	view = View.findDrawableById("lblTime");
        step = View.findDrawableById("lblStep");
        image = View.findDrawableById("feet");
        
        View.onUpdate(dc);
    }
    
	function refresh() {
    	jour = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
    	labelDay.setText(jour.day_of_week.toString()+" "+jour.day.toString());
    	
    	stats= System.getSystemStats();
    	pourcentageBat.setText(stats.battery.toNumber().toString()+"%");
    	
    	clock = System.getClockTime().hour;
     	
     	view.setText(verifyTime());
     	
     	nbPasActuel = ActivityMonitor.getInfo().steps;
     	step.setText(nbPasActuel.toString());
     	
     	WatchUi.requestUpdate();
    }
    
    function verifyTime(){
    var temp = "";
   		if(System.getClockTime().hour == 0){
   			clock = 0;
   		}
   		
   		if(System.getClockTime().min <10){
   			temp = "0"+ System.getClockTime().min.toString();
   		}else{
   			temp = System.getClockTime().min.toString();
   		}
   		
    	return clock.toString()+" : "+ temp;
    }

    function onHide() {
    }

}
