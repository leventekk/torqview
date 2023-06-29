import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;

class CalculatorService {
    private var _powerEntries as Array<Number> = [];
    private var _cadenceEntries as Array<Number> = [];

    private var _cadence as Number = 0;
    private var _power as Number = 0;

    private var _interval as Number;

    public function initialize(timerInterval) {
        _interval = timerInterval;
    }

    private function calculate(list as Array<Number>) as Number? {
        var entries = list.size();

        if (entries < _interval) {
            return null;
        }

        var summary = 0;

        for (var i = 0; i < entries; i++) {
            summary += list[i];
        }

        return summary / entries;
    }

    public function reset() as Void {
        _cadenceEntries = [];
        _powerEntries = [];
        _power = 0;
        _cadence = 0;
    }

    public function store(info as Activity.Info) {
        if (info.currentCadence != null && info.currentPower != null) {
            _cadenceEntries.add(info.currentCadence);
            _powerEntries.add(info.currentPower);
        }
    }

    public function getCadence() {
        var calculatedCadence = calculate(_cadenceEntries);

        if (calculatedCadence == null) {
            return _cadence;
        }

        _cadence = calculatedCadence;
        _cadenceEntries = [];

        return _cadence;
    }

    public function getPower() {
        var calculatedPower = calculate(_powerEntries);

        if (calculatedPower == null) {
            return _power;
        }

        _power = calculatedPower;
        _powerEntries = [];

        return _power;
    }
}
