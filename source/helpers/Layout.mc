import Toybox.Graphics;
import Toybox.Lang;

class Layout {
    static const LABEL_FONT_SIZE = Graphics.FONT_TINY;

    public static function getLabelHeight() as Number {
        return Graphics.getFontHeight(LABEL_FONT_SIZE);
    }

    public static function getYCenter(dc as Graphics.Dc) as Number or Float {
        var labelHeight = getLabelHeight();
        return dc.getHeight() / 2 + labelHeight / 1.5;
    }
}
