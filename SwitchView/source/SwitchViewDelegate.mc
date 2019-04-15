using Toybox.WatchUi;

class SwitchViewDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }
	
    function onMenu() {	
        return true;
    }
    
    function onSelect(){
    	WatchUi.pushView(new View02(), new Delegate02(),1);
	    return false;
    }
    
    function onNextMode(){
    	return true;
    }
    
    function onNextPage(){
    	return true;
    }
    
    function onPreviousMode(){
    	return true;
    }

	function onPreviousPage(){
		return true;
	}
	
	function onBack(){
		return false;
	}
    
}