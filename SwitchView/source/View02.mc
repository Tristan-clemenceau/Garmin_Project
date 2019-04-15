using Toybox.Application;
using Toybox.WatchUi;

class View02 extends WatchUi.View {

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
        
        labelPrev.setText("Missions");
        labelActual.setText("Chrono");
        labelNext.setText("Stats");
       
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
