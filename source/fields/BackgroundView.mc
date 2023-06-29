import Toybox.Lang;

class BackgroundView extends BaseView {
    public function initialize(fieldId as String) {
        BaseView.initialize(fieldId);
    }

    public function render() {
        _fieldView.setColor(getBackgroundColor());
    }
}
