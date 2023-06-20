class Torque {
    static var NM_VALUE = 9.4588;

    public static function calculateInNm(power, cadence) {
        if (power == 0 || cadence == 0) {
            return 0;
        }

        var torque = (power * NM_VALUE) / cadence;

        return torque.format("%d");
    }
}
