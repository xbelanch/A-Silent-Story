package;

import org.flixel.FlxObject;
import org.flixel.FlxSprite;

// A simple player object
// it only can move and jump
class Player extends FlxSprite
{

	public var canMove:Bool;
	public var canJump:Bool;

	public function new(X:Int, Y:Int)
	{
		super(X, Y);

	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{

	}
}