import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class TorqViewField extends WatchUi.SimpleDataField {
    private var _CalculatorService;

    function initialize() {
        SimpleDataField.initialize();
        var viewInterval = SettingsService.getViewInterval();

        label = formatLabel(viewInterval);
        _CalculatorService = new CalculatorService(viewInterval);
    }

    private function formatLabel(interval) {
        if (interval > 1) {
            return interval.toString() + "s Torque";
        }
        return "Torque";
    }

    function compute(
        info as Activity.Info
    ) as Numeric or Duration or String or Null {
        _CalculatorService.store(info);
        var summary = _CalculatorService.get();

        return Torque.calculateInNm(summary["power"], summary["cadence"]);
    }
}
