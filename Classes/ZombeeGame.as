package
{
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class ZombeeGame extends MovieClip
	{
		//public var human:Human;
		public var gameTimer:Timer;
		public var zombee:Zombee;
		public var pop:Array;
		private var humanNum:int;
		private var startX:Number;
		private var startY:Number;
		
		private var downKeyPressed:Boolean;
		private var upKeyPressed:Boolean;
		private var leftKeyPressed:Boolean;
		private var rightKeyPressed:Boolean;
		
		public function ZombeeGame()
		{
			//human = new Human(Math.random() * 350, Math.random() * 250, this);
			//addChild(human);
			downKeyPressed = false;
			upKeyPressed = false;
			leftKeyPressed = false;
			rightKeyPressed = false;
			
			var newHuman:Human;
			var i:int;
			humanNum = 8;
			
			pop = new Array();
			
			/*
			var h:Number = stage.height;
			var w:Number = stage.width;
			*/
			
			//zombee = new Zombee(w - (w / 2), h - (h / 2), this);
			zombee = new Zombee(200, 150, this);
			
			for (i = 0; i < humanNum; i++)
			{
				newHuman = new Human(this);
				pop.push(newHuman);
				addChild(newHuman);
			}
			
			addChild(zombee);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			
			gameTimer = new Timer(25);
			gameTimer.addEventListener(TimerEvent.TIMER, tick);
			gameTimer.start();
		}
		public function onKeyPress(keyboardEvent:KeyboardEvent):void
		{
			switch (keyboardEvent.keyCode)
			{
				case Keyboard.DOWN:
				downKeyPressed = true;
				break;
				
				case Keyboard.UP:
				upKeyPressed = true;
				break;
				
				case Keyboard.LEFT:
				leftKeyPressed = true;
				break;
				
				case Keyboard.RIGHT:
				rightKeyPressed = true;
				break;
			}
		}
		public function onKeyRelease(keyboardEvent:KeyboardEvent):void
		{
			switch (keyboardEvent.keyCode)
			{
				case Keyboard.DOWN:
				downKeyPressed = false;
				break;
				
				case Keyboard.UP:
				upKeyPressed = false;
				break;
				
				case Keyboard.LEFT:
				leftKeyPressed = false;
				break;
				
				case Keyboard.RIGHT:
				rightKeyPressed = false;
				break;
			}
		}
		public function tick(timerEvent:TimerEvent):void
		{
			var human:Human;
			zombee.tick();
			for each (human in pop)
			{
				human.tick();
			}
			if (downKeyPressed) zombee.moveZ(0,1);
			if (upKeyPressed) zombee.moveZ(0,-1);
			if (leftKeyPressed) zombee.moveZ(-1,0);
			if (rightKeyPressed) zombee.moveZ(1,0);
		}
	}
}