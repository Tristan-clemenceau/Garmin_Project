using Toybox.Application;
using Toybox.WatchUi;

class View03 extends WatchUi.View {

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
        
        labelPrev.setText("Chrono");
        labelActual.setText("Stats");
        labelNext.setText("Missions");
       
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
