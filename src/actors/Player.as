package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	import screens.GameScreen;
	
	/**
	 * ...
	 * @author Rico Evers
	 */
	
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		private var maxspeed:Number = 17;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		
		public function get mSpeed():Number
		{
			return maxspeed;			
		}
		public function set mSpeed(maxS:Number):void
		{
			
			if (maxS > 30)
			{
			trace("maxspeed cannot be more than 30!");
			}
			else {
			maxspeed = maxS;
			}
		}
		public function Destroy():void
		{
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			this.addEventListener(GameScreen.DSTROY, Destroy);
			
			if (controller.up)
			{
				speed = -15;
				
				if (y < 0)
				{
					trace("hoi");
					this.y = stage.stageHeight;
				}
			}
			else if(controller.down)
			{
				speed = 15;
				
				if (this.y > stage.stageHeight)
				{
					this.y = 0;
				}
				
			}else
			{
				
				if (this.y > stage.stageHeight)
				{
					this.y = 0;
				}
				
				if (this.y < 0)
				{
					this.y = stage.stageHeight;
				}
				
				if (speed > 0) speed -= 1.5;
				if (speed < 0) speed += 1.5;
			}
			
			
			if (controller.fire)
			{
				
				
			}
			this.y += speed;
		}
		
	}

}