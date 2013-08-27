package  
{
	import org.flixel.FlxTilemap;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class LevelMap extends FlxTilemap
	{
		[Embed(source = "../res/tileset.png")] public var G_TILES:Class;
		[Embed(source="../res/content/map1.csv",mimeType="application/octet-stream")]
		public static const MAP_1:Class;
		[Embed(source="../res/content/map2.csv",mimeType="application/octet-stream")]
		public static const MAP_2:Class;
		
		public const TILE_WIDTH:int = 10;
		public const TILE_HEIGHT:int = 10;
		public const COLLIDE_TILE:int = 3;
		
		public function LevelMap(levelNum:int = 1) 
		{
			if(levelNum == 1)
				loadMap(new MAP_1(), G_TILES, TILE_WIDTH, TILE_HEIGHT, OFF, 0,1,COLLIDE_TILE);
			else
				loadMap(new MAP_2(), G_TILES, TILE_WIDTH, TILE_HEIGHT, OFF, 0,1,COLLIDE_TILE);
		}
		
	}

}