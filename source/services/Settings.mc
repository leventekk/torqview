import Toybox.Lang;

using Toybox.System;
using Toybox.Application;

class SettingsService {
    static const INTERVAL_KEY = "torqViewInterval";

    public static function getViewInterval() as Number {
        return Application.Properties.getValue(INTERVAL_KEY);
    }

    public static function isWeightSystemInMetric() as Boolean {
        var settings = System.getDeviceSettings();
        return settings.weightUnits == 0;
    }
}
