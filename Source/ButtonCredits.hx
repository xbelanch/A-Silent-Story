import org.flixel.FlxButton;
import org.flixel.FlxSprite;
import org.flixel.FlxText;
import org.flixel.FlxState;
import org.flixel.tweens.FlxTween;
import org.flixel.tweens.misc.Alarm;
import org.flixel.tweens.misc.ColorTween;
import org.flixel.tweens.misc.NumTween;
import org.flixel.tweens.misc.VarTween;
import org.flixel.tweens.util.Ease;
import org.flixel.FlxG;
  
class ButtonCredits extends FlxButton
{
    static var DURATION = 1;
    var tw:ColorTween;
    var numTween:NumTween;
  
    public function new(X:Float, Y:Float, Text:String, _callback:Void->Void = null, Size:Int = 25, FadeIn:Bool = true, FadeOut:Bool = true, _timeIn:Float = .5, _duration:Float = 3)
    {

        super(X, Y, Text, _callback);
        this.label = new FlxText(0, 0, 640, Text);
        this.label.alignment = "center";
        this.label.color = 0xffffffff;
        this.loadGraphic("assets/mybutton.png",true,false,640, 25);
        this.alpha = 1.0;
        this.label.size = Size;
		this.onOver = _onOver;
		this.onOut = _onOut;

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
     

  	override public function destroy():Void
  	{
  		super.destroy();
  	}

    override public function update():Void
    {
        super.update();
    	this.label.alpha = numTween.value;
    }

    private function onAlarmFadeIn():Void
    {
        numTween.tween(0, 1, DURATION, Ease.sineIn);
    }

    private function onAlarmFadeOut():Void
    {
        numTween.tween(1, 0, DURATION, Ease.sineOut);
    }

	private function _onOver():Void
	{
		this.label.color = 0xffffff00;
	}
	public function _onOut():Void
	{
		this.label.color = 0xffffffff;
	}

}







