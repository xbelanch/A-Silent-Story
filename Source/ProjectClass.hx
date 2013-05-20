package;

import nme.Lib;
import nme.display.StageDisplayState;
import flash.events.Event;
import org.flixel.FlxGame;
import org.flixel.FlxCamera;
import org.flixel.FlxG;

class ProjectClass extends FlxGame
{	
	public function new()
	{
		var stageWidth:Int = Lib.current.stage.stageWidth;
		var stageHeight:Int = Lib.current.stage.stageHeight;
		var ratioX:Float = stageWidth / 640;
		var ratioY:Float = stageHeight / 576;
		var ratio:Float = Math.min(ratioX, ratioY);

		#if (flash || desktop || neko)
		super(Math.floor(stageWidth / ratio), Math.floor(stageHeight / ratio), MenuState, ratio, 60, 60);
		#else
		super(Math.floor(stageWidth / ratio), Math.floor(stageHeight / ratio), MenuState, ratio, 60, 30);
		#end
		
		// http://haxeflixel.com/forum/help/ios-orientation-and-game-scaling
		// probably this saves the problem of Android orientation?
		if (stageHeight > stageWidth) {
  			stageWidth = Lib.current.stage.stageHeight;
  			stageHeight = Lib.current.stage.stageWidth;
		}
	}

	// fullscreen?
	// Check out www.haxeflixel.com/snippets/toogling-fullscreen
	override private function create(FlashEvent:Event):Void
	{
		super.create(FlashEvent);
		FlxG.stage.addEventListener(Event.RESIZE, window_resized);
	}

	override function step() 
	{
	    super.step();
	    #if !FLX_NO_KEYBOARD
	        #if (flash || js)
	        if (FlxG.keys.justReleased("F11"))
	        #else
	        if (FlxG.keys.ALT && FlxG.keys.justReleased("ENTER"))
	        #end
	        {
	            toggle_fullscreen();
	        }
	    #end
	}
	 
	private function toggle_fullscreen()
	{
	    if (FlxG.stage.displayState == StageDisplayState.NORMAL) 
	        FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
	    else
	        FlxG.stage.displayState = StageDisplayState.NORMAL;
	 
	    window_resized();
	}

	private function window_resized(e:Event = null)
	{
		x = (FlxG.stage.stageWidth - (FlxG.width * FlxCamera.defaultZoom)) / 2;
		y = (FlxG.stage.stageHeight- (FlxG.height * FlxCamera.defaultZoom)) / 2 ;
	}
}
