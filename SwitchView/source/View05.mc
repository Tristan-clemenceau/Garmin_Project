using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time.Gregorian;

class View05 extends WatchUi.View {

var lblName;
var timer;
var seconde;
var minute;


function initialize() {
	View.initialize();
	seconde = 0;
	minute = 0;
	timer = new Timer.Timer();
	timer.start(method(:refresh),1000,true);
}

function onLayout(dc) {
	setLayout(Rez.Layouts.MainLayout02(dc));
}


function onShow() {

}


function onUpdate(dc) {

	lblName = View.findDrawableById("lblName");

	View.onUpdate(dc);
}

function refresh() {
	if(seconde == 59) {
		seconde = 0;
		minute +=1;
		timer.stop();
	}
	seconde+=1;
	lblName.setText(verifyTime());
	
	WatchUi.requestUpdate();
}


function verifyTime(){
	var tmpS = "";
	var tmpM = "";
	if(minute<10){
		tmpM = "0"+ minute.toString();
	}
	else {
		tmpM = minute.toString();
	}
	if(seconde<10){
		tmpS = "0"+seconde.toString();
	}
	else {
		tmpS = seconde.toString();
	}
	
	return tmpM.toString()+":"+tmpS.toString();
}

function onHide() {
}

}