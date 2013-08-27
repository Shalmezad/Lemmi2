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
		override public function create():void
		{
			FlxG.bgColor = 0xff00cccc;
			map = new LevelMap();
			add(map);
			player = new Player();
			add(player);
			cameraSetup();
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
		}
	}

}