package screens 
{
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import utils.Controller;
	import flash.events.KeyboardEvent;
	import screens.GameScreen;
	/**
	 * ...
	 * @author Rico Evers
	 */
	public class IntroScreen extends Screen 
	{
		private var title:TextField;
		private var start:TextField;
		
		public static const START_GAME:String = "start game";		
				
		
		
		
		public function IntroScreen() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
						
			title = new TextField();
			title.embedFonts = true;
			title.text = "Pong";
			title.autoSize = TextFieldAutoSize.CENTER;			
			title.setTextFormat(textFormat);		
			
			title.x = stage.stageWidth / 2 - title.textWidth /2;
			title.y = stage.stageHeight / 2 - title.textHeight /2;
			
			title.mouseEnabled = false;
			
			addChild(title);
			
			
			
			start = new TextField();
			start.embedFonts = true;
			start.text = "1. Normal mode";
			start.autoSize = TextFieldAutoSize.CENTER;
			start.setTextFormat(subFormat)
			
			start.x = stage.stageWidth / 2 - start.textWidth / 2;
			start.y = stage.stageHeight / 2 + 25;
			
			title.mouseEnabled = false;
			
			addChild(start);
			
			start = new TextField();
			start.embedFonts = true;
			start.text = "2. Crazy mode";
			start.autoSize = TextFieldAutoSize.CENTER;
			start.setTextFormat(subFormat)
			
			title.mouseEnabled = false;
			
			start.x = stage.stageWidth / 2 - start.textWidth / 2;
			start.y = stage.stageHeight / 2 + 50;
			
			addChild(start);
			
			
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode == 49) {	
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				GameScreen.modes = 1;
				dispatchEvent(new Event(START_GAME));
				
			}
			if (e.keyCode == 50) {
				stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
				GameScreen.modes = 2;
				dispatchEvent(new Event(START_GAME));
				
			}
		}
		private var dir:Boolean = true;
		
		
	}

}