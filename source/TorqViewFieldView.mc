import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;
import Toybox.Application;
using Toybox.Graphics;

class TorqViewFieldView extends WatchUi.DataField {
    enum {
        FIELD_LABEL = "Label",
        FIELD_VALUE = "Value",
        FIELD_UNIT = "Unit",
        FIELD_BACKGROUND = "Background",
    }

    private var _CalculatorService = new CalculatorService(
        SettingsService.getViewInterval()
    );

    private var _UnitView = new UnitView(FIELD_UNIT, SettingsService, Layout);
    private var _LabelView = new LabelView(FIELD_LABEL, SettingsService);
    private var _ValueView = new ValueView(
        FIELD_VALUE,
        SettingsService,
        _CalculatorService,
        Font,
        Torque,
        Layout
    );
    private var _BackgroundView = new BackgroundView(FIELD_BACKGROUND);

    public function initialize() {
        DataField.initialize();
    }

    public function onLayout(dc as Graphics.Dc) as Void {
        View.setLayout(Rez.Layouts.MainLayout(dc));

        _LabelView.setField(View.findDrawableById(FIELD_LABEL));
        _BackgroundView.setField(View.findDrawableById(FIELD_BACKGROUND));
        _UnitView.setField(View.findDrawableById(FIELD_UNIT));
        _ValueView.setField(View.findDrawableById(FIELD_VALUE));
    }

    public function onUpdate(dc as Graphics.Dc) as Void {
        _BackgroundView.render();
        _LabelView.render(dc);
        _UnitView.render(dc);
        _ValueView.render(dc);

        View.onUpdate(dc);
    }

    public function onTimerPause() as Void {
        _CalculatorService.reset();
    }

    public function onTimerStop() as Void {
        _CalculatorService.reset();
    }

    public function compute(info as Activity.Info) as Void {
        _CalculatorService.store(info);
    }
}
