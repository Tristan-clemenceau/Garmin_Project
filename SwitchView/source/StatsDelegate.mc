using Toybox.WatchUi;

class StatsDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

   function onMenu() {
        return true;
    }
    
   function onNextPage(){
	    return false;
    }
    
   function onSelect(){	
	    return false;
    }
    
   function onPreviousPage(){
	    return false;
    }
    
   function onPreviousMode(){
    	return true;
    }
    
    function onBack(){
    	WatchUi.switchToView(new View02(), new Delegate02(), 2);
	    return true;
    }
    
    function onNextMode(){
    	return true;
    }
    

}