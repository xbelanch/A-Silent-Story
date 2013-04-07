import org.flixel.FlxText;
import org.flixel.tweens.FlxTween;
import org.flixel.tweens.misc.Alarm;
import org.flixel.tweens.misc.ColorTween;
import org.flixel.tweens.misc.NumTween;
import org.flixel.tweens.misc.VarTween;
import org.flixel.tweens.util.Ease;
import org.flixel.FlxG;
  
class Credits extends FlxText
{
    static var DURATION = 1;
    var tw:ColorTween;
    var numTween:NumTween;
  
    public function new(X:Float, Y:Float, Text:String, Size:Int, FadeIn:Bool = true, FadeOut:Bool = true, _timeIn:Float = .5, _duration:Float = 3)
    {
        super(X, Y, 640, Text);
        size = Size;
        alignment = "center";
        numTween = new NumTween(null, FlxTween.PERSIST);
        addTween(numTween);
        if (FadeIn)
        {
            var alarmFadeIn:Alarm = new Alarm(_timeIn, onAlarmFadeIn, FlxTween.ONESHOT);
            addTween(alarmFadeIn, true);
        }

        if (FadeOut)
        {
            var alarmFadeOut:Alarm = new Alarm(_timeIn + _duration, onAlarmFadeOut, FlxTween.ONESHOT);
            addTween(alarmFadeOut, true);
        }
    }
     
    private function onAlarmFadeIn():Void
    {
        numTween.tween(0, 1, DURATION, Ease.sineIn);
    }

    private function onAlarmFadeOut():Void
    {
        numTween.tween(1, 0, DURATION, Ease.sineOut);
    }
  
    override public function update():Void
    {
        super.update();
        alpha = numTween.value;
    }
}