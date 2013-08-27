package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameState extends FlxState
	{
		private var player:Player;
		private var map:LevelMap;
		private var hat:Hat;
		private var levelNum:int;
		private var exits:FlxGroup;
		
		public function GameState(levelNum:int = 2) {
			this.levelNum = levelNum;
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff00cccc;
			loadMap(levelNum);
			player = new Player();
			player.x = map.mapFeatures.player[0].@startTileX * LevelMap.TILE_WIDTH;
			player.y = map.mapFeatures.player[0].@startTileY * LevelMap.TILE_HEIGHT;
			add(player);
			cameraSetup();
			hat = new Hat();
			hat.x = 100;
			hat.y = 100;
			add(hat);
		}
		
		private function loadMap(levelNum:int):void
		{
			map = new LevelMap(levelNum);
			add(map);
		}
		
		private function cameraSetup():void
		{
			FlxG.camera.setBounds(0, 0, map.width, map.height);
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = map.width;
			FlxG.worldBounds.height = map.height;
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
			FlxG.collide(hat, player, getHat);
		}
		
		private function getHat(a:FlxObject, b:FlxObject):void
		{
			hat.kill();
			player.getHat();
		}
	}

}