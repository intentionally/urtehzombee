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
			/*if (xDir > 0)
			{
				this.rotation = 90;
			}*/
			x += xDir * spd;
			y += yDir * spd;
		}
		public function tick():void
		{
			
		}
	}
}