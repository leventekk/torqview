import Toybox.Lang;
using Toybox.Graphics;

class Font {
    private static var _fontSizes =
        [
            Graphics.FONT_NUMBER_THAI_HOT,
            Graphics.FONT_NUMBER_HOT,
            Graphics.FONT_NUMBER_MEDIUM,
            Graphics.FONT_NUMBER_MILD,
            Graphics.FONT_LARGE,
        ] as Array<Graphics.FontDefinition>;

    public static function getRecommendedSize(
        space as Number
    ) as Graphics.FontDefinition {
        for (var i = 0; i < _fontSizes.size(); i++) {
            var fontHeight = Graphics.getFontHeight(_fontSizes[i]);
            var diff = (space - fontHeight) / 2;

            if (fontHeight + diff <= space) {
                return _fontSizes[i];
            }
        }

        return Graphics.FONT_NUMBER_MEDIUM;
    }
}
