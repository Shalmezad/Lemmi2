package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Hat extends FlxSprite
	{
		[Embed(source = "../res/hats/hat.png")] public var G_HAT:Class;
		[Embed(source = "../res/hats/hat-boxer.png")] public var G_HAT_BOXER:Class;
		[Embed(source = "../res/hats/hat-construct.png")] public var G_HAT_CONSTRUCT:Class;
		[Embed(source = "../res/hats/hat-demo.png")] public var G_HAT_DEMO:Class;
		
		//NOTE: Order of graphics *MUST* be same order as Player.states.
		private var GA_HAT:Array = [null, G_HAT,
										G_HAT_BOXER, G_HAT_CONSTRUCT,
										G_HAT_DEMO];
										
		public var hatType:int;
										
		public function Hat(hatXML:XML) 
		{
			x = hatXML.@tileX * LevelMap.TILE_WIDTH;
			y = hatXML.@tileY * LevelMap.TILE_HEIGHT;
			loadGraphic(GA_HAT[hatXML.@type]);
			hatType = hatXML.@type;
		}
		override public function update():void
		{
			super.update();
		}
		
	}

}