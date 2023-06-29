using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {
    hidden var _color as Graphics.ColorValue?;

    function initialize() {
        var dictionary = {
            :identifier => "Background",
        };

        Drawable.initialize(dictionary);
    }

    function setColor(color as Graphics.ColorValue) {
        _color = color;
    }

    function draw(dc as Graphics.Dc) {
        if (_color != null) {
            dc.setColor(Graphics.COLOR_TRANSPARENT, _color);
        }
        dc.clear();
    }
}
