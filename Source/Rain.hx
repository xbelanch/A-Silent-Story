import org.flixel.FlxG;
import org.flixel.FlxSprite;
import org.flixel.FlxEmitter;
import org.flixel.FlxParticle;
import org.flixel.FlxState;
import org.flixel.FlxTypedGroup;
import org.flixel.FlxObject;
  
class Rain extends FlxEmitter
{
    var splashes:FlxTypedGroup<FlxEmitter>;
    var hitObj:Array<FlxSprite>;
     
    public function new(imgParticleRain:String, _state:FlxState, _hitObj_:Array<FlxSprite> = null):Void
    {
        super(0, 0, 15);
        this.setSize(FlxG.width, 0);
        this.setXSpeed(-350, -350);
        this.setYSpeed(1250, 1250);
        this.setRotation(0, 0);
        this.lifespan = 1.0;
        hitObj = _hitObj_;
  
        var rainDrop:FlxParticle;
        for (i in 0...this.maxSize)
        {
            rainDrop = new FlxParticle();
            rainDrop.loadGraphic(imgParticleRain);
            rainDrop.visible = false; //Make sure the particle doesn't show up at (0, 0)
            this.add(rainDrop);
        }
  
        // add a splash emitter
        var numSplashes:Int = 1;
        var numParticlesInSplash = 5;
        splashes = new FlxTypedGroup<FlxEmitter>(numSplashes);
        var splashParticle:FlxParticle;
  
        for (i in 0...numSplashes)
        {
            var splash:FlxEmitter = new FlxEmitter(0, 0, numParticlesInSplash);
            splash.setSize(0, 0);
            splash.setYSpeed( -200, -20);
            splash.setRotation( -720, 720);
            splash.gravity = 400;
            splash.bounce = 1.0;
               
            for (j in 0...numParticlesInSplash)
            {
                splashParticle = new FlxParticle();
                splashParticle.makeGraphic(5, 5, 0xff857cf0);
                splashParticle.visible = false; //Make sure the particle doesn't show up at (0, 0)
                splash.add(splashParticle);
            }
             
            splashes.add(splash);
             
            _state.add(this);
            _state.add(splashes);
             
            this.start(false, 1, 0.13);
        }
    }
  
    override public function destroy():Void
    {
        super.destroy();
         
        splashes = null;
        hitObj = null;
    }
  
    override public function update():Void
    {
        super.update();
        if (hitObj != null)
        {
            for (_obj in hitObj)
            {
                FlxG.overlap(_obj, this, onGround);
                FlxG.collide(_obj, splashes);
            }
        }
    }
  
    private function onGround(grnd:FlxObject, drop:FlxObject):Void
    {
        var splash:FlxEmitter = splashes.recycle();
        if (splash != null)
        {
            splash.x = drop.x;
            splash.y = grnd.y;
              
            splash.start(true, 1);
        }
         
        drop.kill();
    }
}