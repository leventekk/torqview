import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TorqViewApp extends Application.AppBase {
    protected var _viewInterval;

    public function initialize() {
        AppBase.initialize();
        _viewInterval = SettingsService.getViewInterval();
    }

    public function onStart(state as Dictionary?) as Void {}

    public function onStop(state as Dictionary?) as Void {}

    public function getInitialView() as Array<Views or InputDelegates>? {
        var view = new TorqViewView(_viewInterval);
        return [view] as Array<Views or InputDelegates>;
    }
}

function getApp() as TorqViewApp {
    return Application.getApp() as TorqViewApp;
}
