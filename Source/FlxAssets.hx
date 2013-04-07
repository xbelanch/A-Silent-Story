package ;
import nme.display.Bitmap;
import nme.media.Sound;
import nme.Assets;


// @author Xavier Belanche

class FlxAssets
{
	public static var imgSpawnerGibs:Class<Bitmap> = ImgSpawnerGibs;
	public static var imgParticleRain:Class<Bitmap> = ImgParticleRain;

}

class ImgSpawnerGibs extends Bitmap
{
	public function new() { super(Assets.getBitmapData("assets/spawner_gibs.png")); }
}

class ImgParticleRain extends Bitmap
{
	public function new() { super(Assets.getBitmapData("assets/rain_particle2.png")); }
}