using Toybox.Application;
using Toybox.WatchUi;

class View04 extends WatchUi.View {

  var labelPrev;
  var labelActual;
  var labelNext;

  function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.SecondLayout(dc));
    }

    function onShow() {
    }

    function onUpdate(dc) {
        
        labelPrev = View.findDrawableById("previous");
        labelActual = View.findDrawableById("test");
        labelNext = View.findDrawableById("next");
        
        labelPrev.setText("Stats");
        labelActual.setText("Missions");
        labelNext.setText("Chrono");
       
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
