package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameState extends FlxState
	{
		[Embed(source = "../res/coin.png")] public var G_COIN:Class;
		
		private var player:Player;
		private var map:LevelMap;
		private var hat:Hat;
		private var levelNum:int;
		private var exits:FlxGroup;
		
		public function GameState(levelNum:int = 1) {
			this.levelNum = levelNum;
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xff00cccc;
			loadMap(levelNum);
			loadExits();
			loadPlayer();
			cameraSetup();
			/*if (map.mapFeatures.hat.length() > 0)
			{
				hat = new Hat();
				hat.x = map.mapFeatures.hat[0].@tileX * LevelMap.TILE_WIDTH;
				hat.y = map.mapFeatures.hat[0].@tileY * LevelMap.TILE_HEIGHT;
				add(hat);
			}*/
			for each (var hatXML:XML in map.mapFeatures.hat)
			{
				hat = new Hat(hatXML);
				add(hat);
			}
		}
		
		private function loadExits():void
		{
			exits = new FlxGroup();
			for each (var exitXML:XML in map.mapFeatures.exit)
			{
				var exit:FlxSprite = new FlxSprite();
				exit.loadGraphic(G_COIN);
				exit.x = exitXML.@tileX * LevelMap.TILE_WIDTH;
				exit.y = exitXML.@tileY * LevelMap.TILE_HEIGHT;
				exits.add(exit);
				trace("Exit: " + exit.x + "," + exit.y);
			}
			add(exits);
		}
		
		private function loadPlayer():void
		{
			player = new Player();
			player.x = map.mapFeatures.player[0].@startTileX * LevelMap.TILE_WIDTH;
			player.y = map.mapFeatures.player[0].@startTileY * LevelMap.TILE_HEIGHT;
			add(player);
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
			if(hat != null)
				FlxG.overlap(hat, player, getHat);
			FlxG.overlap(exits, player, exitMap);
		}
		
		private function exitMap(a:FlxObject, b:FlxObject):void
		{
			FlxG.switchState(new GameState(levelNum+1));
		}
		
		private function getHat(a:FlxObject, b:FlxObject):void
		{
			hat.kill();
			player.getHat();
		}
	}

}