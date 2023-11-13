import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Sensor;

class ParaWatchApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        System.println("App init");

        // Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        // Sensor.enableSensorEvents(method( :onSensor));
    }

    // function onSensor(sensorInfo as Sensor.Info) as Void {
        // System.print("Pressure: ");
        // System.println(sensorInfo.pressure);
    // }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new ParaWatchView(), new ParaWatchDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as ParaWatchApp {
    return Application.getApp() as ParaWatchApp;
}