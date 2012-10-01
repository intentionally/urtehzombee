package
{
	import flash.display.MovieClip;
	
	public class Human extends MovieClip
	{
		public var zombified:Boolean;
		public var dir:Number;
		public var speed:Number;
		private var game:ZombeeGame;
		private var spd:Number;
		private var xDir:Number;
		private var yDir:Number;
		
		public function Human(zg:ZombeeGame)
		{
			zombified = false;
			game = zg;
			calculateSpawnZone();
			randomDir();
			randomSpd();
		}
		public function randomDir():void
		{
			xDir = (Math.random() - 2) + 1;
			yDir = (Math.random() - 2) + 1;
			
			if (yDir < -1) yDir = -1;
			if (yDir > 1) yDir = 1;
			if (xDir < -1) xDir = -1;
			if (xDir > 1) xDir = 1;
		}
		public function randomSpd():void
		{
			spd = Math.ceil(randomRange(0,2));
		}
		public function calculateSpawnZone():void
		{
			var startX:Number;
			var startY:Number;
			/*var zMinX = (game.stage.width / 2) - (game.zombee.width / 2) - (this.width / 2);
			var zMaxX = (game.stage.width / 2) + (game.zombee.width / 2) + (this.width / 2);
			var zMinY = (game.stage.height / 2) - (game.zombee.height / 2) - (this.height / 2);
			var zMaxY = (game.stage.height / 2) + (game.zombee.height / 2) + (this.height / 2);
			*/
			startX = 0;
			startY = 0;
			/*
			do
			{
				startX = randomRange(this.width / 2, game.stage.width - (this.width / 2));
			} while ((startX >= zMinX) && (startX <= zMaxX));
			do
			{
				startY = randomRange(this.height / 2, game.stage.height - (this.height / 2));
			} while ((startY >= zMinY) && (startY <= zMaxY));
			*/
			startX = randomRange(0, 400);
			startY = randomRange(0, 300);
			
			this.x = startX;
			this.y = startY;
		}
		public function randomRange(min:Number, max:Number):Number
		{
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}
		public function runAway():void
		{
			x += xDir * spd;
			y += yDir * spd;
		}
		public function tick():void
		{
			runAway();
			if (this.hitTestObject(game.zombee))
			{
				zombified = true;
			}
			if (zombified)
			{
				spd = 0;
			}
		}
	}
}