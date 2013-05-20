package;

import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;
import org.flixel.FlxButton;

// A simple player object
// it only can move and jump
class Player extends FlxSprite
{

	private var _aim:Int;
	public var canMove:Bool;
	public var canJump:Bool;
	public var isReadyToJump:Bool;

	public function new(X:Int, Y:Int)
	{
		super(X, Y);
		loadGraphic("assets/sprites/player4.png", 24, 120, true);
		width = 24;
		height = 48;
		offset.x = 3;
		offset.y = 3;

		//basic player physics
		maxVelocity.x = 100; // walking speed
		drag.x = maxVelocity.x * 4; // deceleration
		acceleration.y = 400; // gravity

		// animations
		addAnimation("idle",[0],0,false);
		addAnimation("walk",[1,2,3,0],10,true);
		addAnimation("walk_back",[3,2,1,0],10,true);
		addAnimation("flail",[1,2,3,0],18,true);
		addAnimation("jump",[4],0,false);


	}

	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{

		// le movement
		//Smooth slidey walking controls
		acceleration.x = 0;
		if(FlxG.keys.LEFT)
			acceleration.x -= drag.x;
		if(FlxG.keys.RIGHT)
			acceleration.x += drag.x;
		
		if(isTouching(FlxObject.FLOOR))
		{
			//Jump controls
			if(FlxG.keys.justPressed("SPACE"))
			{
				velocity.y = -acceleration.y*0.71;
				play("jump");
			}//Animations
			else if(velocity.x > 0){
				play("walk");
			}
			else if(velocity.x < 0){
				play("walk_back");
			}
			else
				play("idle");
		}
		else if(velocity.y < 0)
			play("jump");
		else
			play("flail");

		
	}
}