import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class TorqViewApp extends Application.AppBase {
    public function initialize() {
        AppBase.initialize();
    }

    public function onStart(state as Dictionary?) as Void {}

    public function onStop(state as Dictionary?) as Void {}

    public function getInitialView() as Array<Views or InputDelegates>? {
        var view = new TorqViewField();
        return [view] as Array<Views or InputDelegates>;
    }
}

function getApp() as TorqViewApp {
    return Application.getApp() as TorqViewApp;
}
