import Toybox.Lang;
import Toybox.WatchUi;

class BaseView extends WatchUi.DataField {
    hidden var _fieldId as String;
    hidden var _fieldView as Text?;

    public function initialize(fieldId as String) {
        DataField.initialize();
        _fieldId = fieldId;
    }

    public function getField() as Text {
        return _fieldView;
    }

    public function setField(fieldView as Text) {
        _fieldView = fieldView;
    }

    protected function setText(value as String) as Void {
        _fieldView.setText(value);
    }

    protected function setTextColor() as Void {
        var textColor =
            getBackgroundColor() == Graphics.COLOR_BLACK
                ? Graphics.COLOR_WHITE
                : Graphics.COLOR_BLACK;

        _fieldView.setColor(textColor);
    }
}
