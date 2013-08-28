package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Player extends FlxSprite
	{
		[Embed(source = "../res/player/player.png")] public const G_PLAYER:Class;
		[Embed(source = "../res/player/player-nohat.png")] public const G_PLAYER_NOHAT:Class;
		[Embed(source = "../res/player/player-boxer.png")] public const G_PLAYER_BOXER:Class;
		[Embed(source = "../res/player/player-construct.png")] public const G_PLAYER_CONSTRUCT:Class;
		[Embed(source = "../res/player/player-demo.png")] public const G_PLAYER_DEMO:Class;
		
		//NOTE: Order of graphics *MUST* be same order as states.
		private var GA_PLAYER:Array = [G_PLAYER_NOHAT, G_PLAYER,
										G_PLAYER_BOXER, G_PLAYER_CONSTRUCT,
										G_PLAYER_DEMO];
		
		public static const STATE_NOHAT:int = 0;
		public static const STATE_NORMAL:int = 1;
		public static const STATE_BOXER:int = 2;
		public static const STATE_CONSTRUCT:int = 3;
		public static const STATE_DEMO:int = 4;
		
		public static var currentState:int = STATE_NOHAT;
		
		public function Player(playerXML:XML) 
		{
			x = playerXML.@startTileX * LevelMap.TILE_WIDTH;
			y = playerXML.@startTileY * LevelMap.TILE_HEIGHT;
			currentState = playerXML.@startType;
			loadGraphic(GA_PLAYER[currentState], true, true, 7, 10);
			addAnimation("stand", [0], 0);
			addAnimation("walk", [1,2,1,3], 10);
			play("stand");
			maxVelocity.x = 50;
			acceleration.y = 200;
			drag.x = maxVelocity.x * 4;
		}
		
		public function getHat(hatType:int):void
		{
			currentState = hatType;
			var tempFacing:uint = facing;
			loadGraphic(GA_PLAYER[hatType] as Class, true, true, 7, 10);
			facing = tempFacing;
		}
		
		
		override public function update():void
		{
			acceleration.x = 0;
			if(Key.LEFT){
				acceleration.x = -maxVelocity.x * 4;
				play("walk");
			}
			else if(Key.RIGHT){
				acceleration.x = maxVelocity.x * 4;
				play("walk");
			}
			
			if (velocity.x > 0) {
				facing = RIGHT;
			}
			else if (velocity.x < 0) {
				facing = LEFT;
			}
			
			else {
				play("stand");
			}
			
			if(currentState != STATE_NOHAT){
				if (Key.JUMP && isTouching(FLOOR)) {
					velocity.y = -125;
				}
			}
		}
	}

}