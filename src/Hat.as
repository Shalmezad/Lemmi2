package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Hat extends FlxSprite
	{
		[Embed(source = "../res/hat.png")] public var G_HAT:Class;
		public function Hat() 
		{
			loadGraphic(G_HAT);
		}
		override public function update():void
		{
			super.update();
		}
		
	}

}