package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../res/player/player.png")] public var G_PLAYER:Class;
		[Embed(source = "../res/player/player-nohat.png")] public var G_PLAYER_NOHAT:Class;
		
		public static var hasHat:Boolean = false;
		
		public function Player() 
		{
			if(hasHat)
				loadGraphic(G_PLAYER, true, true, 7, 10);
			else
				loadGraphic(G_PLAYER_NOHAT, true, true, 7, 10);
			addAnimation("stand", [0], 0);
			addAnimation("walk", [1,2,1,3], 10);
			play("stand");
			maxVelocity.x = 50;
			acceleration.y = 200;
			drag.x = maxVelocity.x * 4;
		}
		
		public function getHat():void
		{
			hasHat = true;
			loadGraphic(G_PLAYER, true, true, 7, 10);
		}
		
		override public function update():void
		{
			acceleration.x = 0;
			if(Key.LEFT){
				acceleration.x = -maxVelocity.x * 4;
				facing = LEFT;
				play("walk");
			}
			else if(Key.RIGHT){
				acceleration.x = maxVelocity.x * 4;
				facing = RIGHT;
				play("walk");
			}
			else {
				play("stand");
			}
			
			if(hasHat){
				if (Key.JUMP && isTouching(FLOOR)) {
					velocity.y = -125;
				}
			}
		}
	}

}