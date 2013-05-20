package ;
import nme.display.Bitmap;
import nme.media.Sound;
import nme.Assets;


// @author Xavier Belanche

class FlxAssets
{
	public static var imgParticleRain:Class<Bitmap> = ImgParticleRain;
}


class ImgParticleRain extends Bitmap
{
	public function new() { super(Assets.getBitmapData("assets/rain_particle.png")); }
}