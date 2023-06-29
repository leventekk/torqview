import Toybox.Lang;
import Toybox.Graphics;

class ValueView extends BaseView {
    private var _SettingsService;
    private var _CalculatorService;
    private var _FontService;
    private var _TorqueService;

    private const FONT_SIZE = Graphics.FONT_TINY;

    public function initialize(
        fieldId as String,
        SettingsService,
        CalculatorService,
        FontService,
        TorqueService
    ) {
        BaseView.initialize(fieldId);

        _SettingsService = SettingsService;
        _CalculatorService = CalculatorService;
        _FontService = FontService;
        _TorqueService = TorqueService;
    }

    private function format() as String {
        var value = calculateValue();
        return value.format("%d");
    }

    private function getYCenter(dc as Graphics.Dc) as Float {
        var labelHeight = Graphics.getFontHeight(FONT_SIZE);
        return dc.getHeight() / 2 + labelHeight / 1.5;
    }

    private function setFontSize(dc as Graphics.Dc) as Void {
        var labelHeight = Graphics.getFontHeight(FONT_SIZE);
        var availableSpace = dc.getHeight() - labelHeight;
        var fontSize = _FontService.getRecommendedSize(availableSpace);

        _fieldView.setFont(fontSize);
    }

    private function setPosition(dc as Graphics.Dc) as Void {
        _fieldView.setLocation(_fieldView.locX, getYCenter(dc));
    }

    private function calculateValue() as Number or Float {
        var power = _CalculatorService.getPower();
        var cadence = _CalculatorService.getCadence();

        // System.println("Cadence: " + cadence);

        if (_SettingsService.isWeightSystemInMetric()) {
            return _TorqueService.calculateInNm(power, cadence);
        }

        return _TorqueService.calculateInStatute(power, cadence);
    }

    public function render(dc as Graphics.Dc) {
        var text = format();
        setPosition(dc);
        setFontSize(dc);
        setTextColor();
        setText(text);
    }
}
