using Toybox.Application;

class SettingsService {
    static const INTERVAL_KEY = "torqViewInterval";

    public static function getViewInterval() {
        return Application.Properties.getValue(INTERVAL_KEY);
    }
}
