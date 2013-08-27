package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Main extends FlxGame 
	{
		private const SCALE:int = 4;
		public function Main():void 
		{
			super(640/SCALE, 480/SCALE, GameState, SCALE);
		}
	}
	
}