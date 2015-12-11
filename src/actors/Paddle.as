package actors 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Rico Evers
	 */
	public class Paddle extends MovieClip 
	{
		
		public function Paddle() 
		{
			addChild(new PaddleArt());
		}
		
	}

}