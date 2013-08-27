package  
{
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author RichardWardin
	 */
	public class LevelMap extends FlxTilemap
	{
		[Embed(source = "../res/tileset.png")] public var G_TILES:Class;
		[Embed(source="../res/content/map1.csv",mimeType="application/octet-stream")]
		public static const MAP_1:Class;
		
		public const TILE_WIDTH:int = 20;
		public const TILE_HEIGHT:int = 20;
		
		public function LevelMap() 
		{
			loadMap(new MAP_1(), G_TILES, TILE_WIDTH, TILE_HEIGHT, OFF);
			
		}
		
	}

}