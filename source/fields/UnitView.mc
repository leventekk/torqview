import Toybox.Lang;
import Toybox.Graphics;

class UnitView extends BaseView {
    private var _SettingsService;

    private const FONT_SIZE = Graphics.FONT_TINY;

    public function initialize(fieldId as String, SettingsService) {
        BaseView.initialize(fieldId);

        _SettingsService = SettingsService;
    }

    private function format() as String {
        if (_SettingsService.isWeightSystemInMetric()) {
            return "NM";
        }

        return "ft-lbs";
    }

    private function getYCenter(dc as Graphics.Dc) {
        var labelHeight = Graphics.getFontHeight(FONT_SIZE);
        return dc.getHeight() / 2 + labelHeight / 1.5;
    }

    private function setPosition(dc as Graphics.Dc) {
        var field = getField();
        field.setLocation(field.locX, getYCenter(dc));
    }

    public function render(dc as Graphics.Dc) as Void {
        var text = format();
        setPosition(dc);
        setTextColor();
        setText(text);
    }
}
