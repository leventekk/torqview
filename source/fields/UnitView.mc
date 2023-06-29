import Toybox.Lang;
import Toybox.Graphics;

class UnitView extends BaseView {
    private var _SettingsService;
    private var _LayoutService;

    private const FONT_SIZE = Graphics.FONT_TINY;

    public function initialize(
        fieldId as String,
        SettingsService,
        LayoutService
    ) {
        BaseView.initialize(fieldId);

        _SettingsService = SettingsService;
        _LayoutService = LayoutService;
    }

    private function format() as String {
        if (_SettingsService.isWeightSystemInMetric()) {
            return "NM";
        }

        return "LBS";
    }

    private function setPosition(dc as Graphics.Dc) {
        _fieldView.setLocation(_fieldView.locX, _LayoutService.getYCenter(dc));
    }

    public function render(dc as Graphics.Dc) as Void {
        var text = format();
        setPosition(dc);
        setTextColor();
        setText(text);
    }
}
