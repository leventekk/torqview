import Toybox.Lang;
using Toybox.Application;

class SettingsService {
    static const INTERVAL_KEY = "torqViewInterval";

    public static function getViewInterval() as Number {
        return Application.Properties.getValue(INTERVAL_KEY);
    }
}
