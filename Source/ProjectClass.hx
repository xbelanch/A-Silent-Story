package;

import nme.Lib;
import org.flixel.FlxGame;
	
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
		
	}
}
