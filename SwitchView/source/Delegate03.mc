using Toybox.WatchUi;

class Delegate03 extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

   function onMenu() {
        return true;
    }
    
    function onNextPage(){
   		WatchUi.switchToView(new View04(), new Delegate04(),0);
	    return false;
    }
    
   function onSelect(){
   		WatchUi.switchToView(new StatsView(), new StatsDelegate(),1);
	    return false;
    }
    
   function onPreviousPage(){
    	WatchUi.switchToView(new View02(), new Delegate02(),0);
	    return false;
    }
    
   function onPreviousMode(){
    	return true;
    }
    
    function onBack(){
    	WatchUi.popView(SLIDE_RIGHT);
	    return true;
    }
    
    function onNextMode(){
    	return true;
    }
    

}