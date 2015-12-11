package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import screens.GameOverScreen;
	import screens.GameScreen;
	import screens.IntroScreen;
	import screens.WinScreen;
	import sounds.SoundPlayer;
	/**
	 * ...
	 * @author Rico Evers
	 */
	public class Main extends Sprite 
	{
		private var gameScreen:GameScreen;
		private var introScreen:IntroScreen;
		private var gameOverScreen:GameOverScreen;
		private var winScreen:WinScreen;
		private var soundPlayer:SoundPlayer;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point			
			soundPlayer = new SoundPlayer(this);
			buildIntroSreen();	
		}
		private function buildIntroSreen():void
		{			
			introScreen = new IntroScreen();
			addChild(introScreen);
			introScreen.addEventListener(IntroScreen.START_GAME, startGame);
		}
		private function startGame(e:Event):void 
		{
			removeChild(introScreen);
			gameScreen = new GameScreen();
			addChild(gameScreen);
			gameScreen.addEventListener(GameScreen.GAME_OVER, onGameOver);
			gameScreen.addEventListener(GameScreen.WIN, onWin);
			
		}		
		
		private function onWin(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen.removeEventListener(GameScreen.WIN, onWin);
						
			winScreen = new WinScreen();
			addChild(winScreen);
			winScreen.addEventListener(WinScreen.RESETW, onResetW);
		}
	
		private function onGameOver(e:Event):void 
		{
			removeChild(gameScreen);
			gameScreen.removeEventListener(GameScreen.GAME_OVER, onGameOver);
						
			gameOverScreen = new GameOverScreen();
			addChild(gameOverScreen);
			gameOverScreen.addEventListener(GameOverScreen.RESETL, onResetL);
			
			
			
		}		
		private function onResetL(e:Event):void 
		{
			removeChild(gameOverScreen);
			gameOverScreen.removeEventListener(GameOverScreen.RESETL, onResetL);
			
			buildIntroSreen();
		}
		private function onResetW(e:Event):void 
		{
			removeChild(winScreen);
			winScreen.removeEventListener(WinScreen.RESETW, onResetW);
			
			buildIntroSreen();
		}
	}
	
}