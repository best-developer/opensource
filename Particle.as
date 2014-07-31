package 
{

	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.display.MovieClip;


	public class Particle extends MovieClip
	{

		protected var position:Point;
		protected var vector:Point;
		private var gravity:int;
		private var friction:Number;
		private var maxIterationsAlive:Number;
		private var iterationsAlive:Number;
		protected var update_i:Timer;

		public function Particle(p:Point, v:Point, g:int, f:Number)
		{
			
			position = p;
			vector = v;
			gravity = g;
			friction = f;
			maxIterationsAlive = 10;
			iterationsAlive = 0;

			update_i = new Timer(25);

			update_i.addEventListener(TimerEvent.TIMER, update);
			update_i.start();
		}

		public function update(evt:TimerEvent):void
		{
			if (iterationsAlive > maxIterationsAlive) {
				update_i.removeEventListener(TimerEvent.TIMER, update);
				update_i.stop();
				parent.removeChild(this);
			}

			//the * 10  determines what direction it shoots out of - in this case the side
			position.x +=  vector.x + Math.random() * 10; 
			position.y +=  vector.y + Math.random() * 10;

			vector.y +=  gravity;
			vector.x *=  friction;
			
			//apply positions to the clip
			x = position.x;
			y = position.y;
			
			alpha -= .01; //fade

			iterationsAlive++;
		}		
		
	}
}
