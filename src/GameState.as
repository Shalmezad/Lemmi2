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
		public function GameState() 
		{
			add(new FlxText(20, 20, 200, "Testing"));
			player = new Player();
			add(player);
			map = new LevelMap();
			add(map);
		}
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
		}
	}

}