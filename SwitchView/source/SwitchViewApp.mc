using Toybox.Application;
using Toybox.WatchUi;

class SwitchViewApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    }

    function onStop(state) {
    }

    function getInitialView() {
        return [ new SwitchViewView(), new SwitchViewDelegate() ];
    }

}
