import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Sensor;

class ParaWatchView extends WatchUi.View {

    private var _pressureElement;

    function initialize() {
        System.println("Initializing ParaWatchView");
        View.initialize();
        
        Sensor.setEnabledSensors([Sensor.SENSOR_HEARTRATE]);
        Sensor.enableSensorEvents(method( :onSensor));
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        _pressureElement = findDrawableById("pressure");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        // dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2, Graphics.FONT_MEDIUM, 
        //     _pressure, 
        //     Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    function onSensor(sensorInfo as Sensor.Info) as Void {
        if (sensorInfo != null && sensorInfo.pressure != null) {
            var pressurehPa = (sensorInfo.pressure / 100).format("%4.2f");

            System.print("Pressure: ");
            System.println(sensorInfo.pressure);
            System.println(pressurehPa);

            if (_pressureElement != null) {
                _pressureElement.setText(pressurehPa);
            }

            WatchUi.requestUpdate();
        }
    }

}
