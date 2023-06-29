import Toybox.Lang;
import Toybox.Graphics;

class LabelView extends BaseView {
    private var _SettingsService;

    public function initialize(fieldId as String, SettingsService) {
        BaseView.initialize(fieldId);
        _SettingsService = SettingsService;
    }

    private function format() as String {
        var viewInterval = _SettingsService.getViewInterval();

        if (viewInterval > 1) {
            return viewInterval.toString() + "s Torque";
        }
        return "Torque";
    }

    public function render(dc as Graphics.Dc) as Void {
        var text = format();
        setTextColor();
        setText(text);
    }
}
