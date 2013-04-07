package;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.plugin.pxText.PxTextAlign;

// personal stuff
import ButtonCredits;
import Credits;
import Rain;

class MenuState extends FlxState
{

	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff000000;
		#else
		FlxG.camera.bgColor = {rgb: 0x000000, a: 0xff};
		#end		
		#if !FLX_NO_MOUSE
		FlxG.mouse.useSystemCursor = true;
		FlxG.mouse.hide();
		#end

		// ground collision 
		var ground:FlxSprite = new FlxSprite(0, 425);
        ground.immovable =  true;
        ground.color = 0xff04013d;
        ground.makeGraphic(640, 5);
        add(ground);
        var hitGround:Array<FlxSprite> = new Array();
        hitGround.push(ground);

		// add menu background
		var background:FlxSprite = new FlxSprite(0, 0);
		background.loadGraphic("assets/backgrounds/back0.png", false, false);
		add(background);

		// add credit Author
		var author:Credits = new Credits(0, 100, "Xavier Belanche presents", 18, true, true, .65, 3);

		// add Game Title and buttons 
		var title:Credits  = new Credits(0, 100, "A Silent Story", 45, true, false, 5); 
		title.color = 0xff857cf0;
		var startGameButton:ButtonCredits = new ButtonCredits(0, 170, "Start New Game", playGame, 22, true, false, 5);

		// Rain stuff
		var rain:Rain = new Rain("assets/rain_particle.png", this, hitGround);

		// add objects to FlxState
		add(rain);
		add(author);
		add(title);
		FlxG.mouse.show();
		add(startGameButton);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}

	private function playGame():Void
	{
		FlxG.flash();
		FlxG.fade(0x000000, 1, false);
	}

}