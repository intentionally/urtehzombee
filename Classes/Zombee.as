package
{
	import flash.display.MovieClip;
	
	public class Zombee extends MovieClip
	{
		private var game:ZombeeGame;
		private var spd:Number;
		
		public function Zombee(startX:Number, startY:Number, zg:ZombeeGame)
		{
			game = zg;
			x = startX;
			y = startY;
			spd = 2;
		}
		public function moveZ(xDir:Number, yDir:Number):void
		{
			if (yDir == 0)
			{
				if (xDir < 0)
				{
					
				}
				else
				{
					
				}
			}
			else
			{
				if (yDir < 0)
					gotoAndStop(1);
				else
					gotoAndStop(3);
			}
			x += xDir * spd;
			y += yDir * spd;
		}
		public function changeDirection():void
		{
			var degrees
		}
		public function tick():void
		{
			
		}
	}
}