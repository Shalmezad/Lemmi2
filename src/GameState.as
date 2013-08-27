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
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
		}
	}

}