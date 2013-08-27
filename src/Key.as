package  
{
	import org.flixel.FlxG;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Key 
	{
		public static function get JUMP():Boolean 
		{
			return FlxG.keys.UP || FlxG.keys.W || FlxG.keys.SPACE || FlxG.keys.Z;
		}
		public static function get LEFT():Boolean
		{
			return FlxG.keys.LEFT || FlxG.keys.A;
		}
		public static function get RIGHT():Boolean
		{
			return FlxG.keys.RIGHT || FlxG.keys.D;
		}
	}

}