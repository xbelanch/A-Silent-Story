package;

import org.flixel.FlxGroup;
import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxObject;

class StarField extends FlxGroup
{

	public static var _num_stars:Int = 75;
	private var _angle:Int;
	private var _hitObj:FlxSprite;

	public function new(ang:Int = 90, speedMultiplier:Int = 8, hitObj:FlxSprite = null ):Void
	{
		super();
		_angle = ang;

		// if there's a ground
		if (hitObj !=null)
		{
			_hitObj = hitObj;
		} else {
			_hitObj = new FlxSprite();
			_hitObj.y = FlxG.height; 
		}



		var radang:Float = _angle * Math.PI / 180;
		var cosang:Float = Math.cos(radang);
		var sinang:Float = Math.sin(radang);

		for (i in 0 ... _num_stars)
		{
			var str:FlxSprite = new FlxSprite(Math.random() * FlxG.width, Math.random() * _hitObj.y);
			var vel:Float = Math.random() * 16 * speedMultiplier;

			// change the transparency of the star based on it's velocity


			#if flash
			var transp:UInt = (Math.round(16 * ( vel / speedMultiplier) - 1) << 24);
			#elseif cpp
			var transp:Int = (Math.round(16 * ( vel / speedMultiplier) - 1) << 24);
			#elseif neko
			var transp:Int = (Math.round(16 * ( vel / speedMultiplier) - 1));
			#end

			str.makeGraphic(8, 8, 0x00ffffff | transp);
			str.velocity.x = cosang * vel;
			str.velocity.y = sinang * vel;
			add(str);	
	
		}
      	
	}

	override public function destroy():Void
	{

		super.destroy();
	}

	private function onGround(grnd:FlxObject, drop:FlxObject):Void
	{
		if ((drop.y > grnd.y && drop.velocity.y < 32.0) ||
			(drop.y - 5 > grnd.y && (drop.velocity.y >= 32.0 && drop.velocity.y < 48)) ||
			(drop.y - 10 > grnd.y && (drop.velocity.y >= 48.0 && drop.velocity.y < 90)) ||
			(drop.y - 25 > grnd.y && (drop.velocity.y >= 90.0 && drop.velocity.y < 110)) ||
			(drop.y - 80 > grnd.y && (drop.velocity.y >= 110)))

		{
			drop.y = 0;
		}
		//drop.kill();
	}

	override public function update():Void
	{

		super.update();

		if (_hitObj != null)
		{
			// mejorar el hecho que los squares + lejanos 
			// mueran antes
			FlxG.overlap(_hitObj, this, onGround);

		}
		
		var star:FlxSprite; 
		for (starMember in members)
		{

			star = cast(starMember, FlxSprite);
			if (star.x > FlxG.width) 
			{
				star.x = 0;
			}
			else if (star.x < 0) 
			{
				star.x = FlxG.width;
			}

			if (star.y > FlxG.height) 
			{	
				star.y = 0;
			}
			else if (star.y < 0) 
			{	
				star.y = FlxG.height;
			}
		}

	}
}