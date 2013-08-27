package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author RichardWardin
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../res/player.png")] public var G_PLAYER:Class;
		public function Player() 
		{
			loadGraphic(G_PLAYER, true, true, 7, 10);
			addAnimation("stand", [0], 0);
			addAnimation("walk", [1,2,1,3], 10);
			play("stand");
			maxVelocity.x = 40;
			acceleration.y = 200;
			drag.x = maxVelocity.x * 4;
		}
		
		override public function update():void
		{
			acceleration.x = 0;
			if(FlxG.keys.A || FlxG.keys.LEFT){
				acceleration.x = -maxVelocity.x * 4;
				facing = LEFT;
				play("walk");
			}
			else if(FlxG.keys.D || FlxG.keys.RIGHT){
				acceleration.x = maxVelocity.x * 4;
				facing = RIGHT;
				play("walk");
			}
			else {
				play("stand");
			}
			
			if ((FlxG.keys.SPACE || FlxG.keys.UP) && isTouching(FLOOR)) {
				velocity.y = -125;
			}
		}
	}

}