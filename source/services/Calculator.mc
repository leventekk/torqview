import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;

class CalculatorService {
    private var _powerEntries = [] as Array<Number>;
    private var _cadenceEntries = [] as Array<Number>;

    private var _cadence = 0 as Number;
    private var _power = 0 as Number;

    private var _interval;

    public function initialize(timerInterval) {
        _interval = timerInterval;
    }

    protected function calculate() as Void {
        var entries = _powerEntries.size();
        var cadenceSummary = 0;
        var powerSummary = 0;

        if (entries < _interval) {
            return;
        }

        for (var i = 0; i < entries; i++) {
            cadenceSummary += _cadenceEntries[i];
            powerSummary += _powerEntries[i];
        }

        _cadence = cadenceSummary / entries;
        _power = powerSummary / entries;

        _powerEntries = [];
        _cadenceEntries = [];
    }

    public function store(info as Activity.Info) {
        if (info.currentCadence != null && info.currentPower != null) {
            _cadenceEntries.add(info.currentCadence);
            _powerEntries.add(info.currentPower);
        }
    }

    public function get() {
        calculate();

        return {
            "cadence" => _cadence as Number,
            "power" => _power as Number,
        };
    }
}
