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

    protected function calculate(list as Array<Number>) as Number {
        var entries = list.size();
        var summary = 0;

        if (entries < _interval) {
            return 0;
        }

        for (var i = 0; i < entries; i++) {
            summary += list[i];
        }

        return summary / entries;
    }

    public function store(info as Activity.Info) {
        if (info.currentCadence != null && info.currentPower != null) {
            _cadenceEntries.add(info.currentCadence);
            _powerEntries.add(info.currentPower);
        }
    }

    public function getCadence() {
        _cadence = calculate(_cadenceEntries);
        _cadenceEntries = [];

        return _cadence;
    }

    public function getPower() {
        _power = calculate(_powerEntries);
        _powerEntries = [];

        return _power;
    }
}
