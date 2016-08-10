using Toybox.Application as App;
using Toybox.WatchUi as Ui;

class BatteryDataFieldApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }
    
    function onStart(state) {
    }

    function onStop(state) {
    }
    
    function getInitialView()
    {
        return [new BatteryDataFieldView()];
    }
    
    function onSettingsChanged()
    {
        Ui.requestUpdate();
    }
}