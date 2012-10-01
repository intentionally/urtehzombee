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
			gotoAndStop(1);
		}
		public function getDistance(x1:Number, x2:Number, y1:Number, y2:Number):Number
		{
			var dx:Number;
			var dy:Number;
			
			dx = x2 - x1;
			dy = y2 - y1;
			
			return Math.sqrt(dx * dx + dy * dy);
		}
		public function toRadians(degrees:Number):Number
		{
			return degrees * (Math.PI / 180);
		}
		public function randomDir():void
		{
			var angle:Number = randomRange(0, 360);
			var radians:Number = toRadians(angle);
			
			xDir = Math.cos(radians);
			yDir = Math.sin(radians);
		}
		public function randomSpd():void
		{
			//spd = Math.ceil(randomRange(1,4));
			spd = 4;
		}
		public function calculateSpawnZone():void
		{
			var startX:Number;
			var startY:Number;
			
			startX = randomRange(this.width/2, 800-(this.width/2));
			startY = randomRange(this.height/2, 600-(this.height/2));
			
			this.x = startX;
			this.y = startY;
		}
		public function randomRange(min:Number, max:Number):Number
		{
			return (Math.floor(Math.random() * (max - min + 1)) + min);
		}
		public function runAway():void
		{
			if (zombified) spd = 2;
			x += xDir * spd;
			y += yDir * spd;
		}
		public function bounceOffWall():void
		{
			if ((this.x >= game.stage.stageWidth - (this.width/2)) || (this.x <= (this.width/2)))
				xDir *= -1;
			if ((this.y >= game.stage.stageHeight - (this.height/2)) || (this.y <= (this.height/2)))
				yDir *= -1;
		}
		public function tick():void
		{
			runAway();
			bounceOffWall();
			if (this.hitTestObject(game.zombee))
				zombified = true;
			if (zombified)
				gotoAndStop(2);
		}
	}
}