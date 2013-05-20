package;

import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.events.MouseEvent;
import nme.display.Graphics;
import nme.display.Sprite;
import nme.Lib;
import org.flixel.FlxG;
import org.flixel.FlxState;
import org.flixel.FlxButton;
import org.flixel.FlxText;
import org.flixel.FlxSprite;

class PlayState extends FlxState
{
	// game object storage
	private var _background:FlxSprite;
	private var _score:FlxText;
	private var _player:Player;
	private var _ground:FlxSprite;
	private var _starfield:StarField;


	// touch interface
	public static var LeftButton:FlxButton;
	public static var RightButton:FlxButton;
	public static var JumpButton:FlxButton;

	public function new()
	{
		super();
	}

	override public function create():Void
	{

		// add menu background
		_background = new FlxSprite(0, 0);
		_background.loadGraphic("assets/backgrounds/back0.png", false, false);
		add(_background);
		
		_score = new FlxText(FlxG.width / 4, 0, Math.floor(FlxG.width / 2) + 10, "Winter");
		_score.setFormat(null, 16, 0xd8eba2, "center", 0x131c1b, true);

		// we can create the player object.
		// _player = new Player(Math.floor(FlxG.width / 2 + 48) , 370);



		// white background?
		var graph = new Sprite();
		graph.graphics.beginFill(0xffdfdfdf);
		graph.graphics.moveTo(0, 325);
		graph.graphics.lineTo(FlxG.width, 325);
		graph.graphics.lineTo(FlxG.width, FlxG.height);
		graph.graphics.lineTo(-FlxG.width, FlxG.height);
		graph.graphics.endFill();

		// http://www.haxeflixel.com/forum/help/doubt-sprite		
		var bitmapData:BitmapData = new BitmapData(FlxG.width,FlxG.height, true, 0x00000000);
		bitmapData.draw(graph);
		var _flxSprite:FlxSprite = new FlxSprite(0, 0, bitmapData);	
		add(_flxSprite);


		// define a simple scenario
		_ground= new FlxSprite(0, 350);
        _ground.immovable =  true;
        // _ground.color = 0xffefefef;
        _ground.color = 0xffdfdfdf;
        _ground.makeGraphic(640, 100);
        add(_ground);

		// then we add the player
		add(_player);
		add(_score);

		// add Starfield
		_starfield = new StarField(90,8, _ground);
		add(_starfield);


	}

	override public function destroy():Void
	{
		super.destroy();
		_player = null;
	}

	override public function update():Void
	{
		super.update();
		FlxG.collide(_ground, _player);

	}

}