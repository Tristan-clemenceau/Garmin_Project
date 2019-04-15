using Toybox.WatchUi;

class UserDelegate extends WatchUi.BehaviorDelegate {

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
    	WatchUi.switchToView(new View04(), new Delegate04() , 4);
	    return true;
    }
    
    function onNextMode(){
    	return true;
    }
    

}