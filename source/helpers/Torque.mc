import Toybox.Lang;
using Toybox.Math;

class Torque {
    public static function calculateInNm(
        power as Number,
        cadence as Number
    ) as Number or Float {
        if (power == 0 || cadence == 0) {
            return 0;
        }

        var torque = power / ((cadence * 2 * Math.PI) / 60);

        return torque;
    }

    public static function calculateInStatute(
        power as Number,
        cadence as Number
    ) as Number or Float {
        if (power == 0 || cadence == 0) {
            return 0;
        }

        var torque = power / ((cadence * 2 * Math.PI) / 60) / 1.356;

        return torque;
    }
}
