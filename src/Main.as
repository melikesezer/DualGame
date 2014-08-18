package
{
	import com.objects.Dueller;
	import com.objects.Gun;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Main extends Sprite
	{
		private var player1:Dueller;
		private var player2:Dueller;
		private var gun:Gun;
		
		public function Main()
		{
			init();
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		protected function onKeyUp(event:KeyboardEvent):void
		{
			switch(event.keyCode){
				case Keyboard.SPACE:
					var shootResult:int = gun.shoot();
					if(shootResult == 0)
						player1.die();
					else if(shootResult == 1)
						player2.die();
					break;
				case Keyboard.CONTROL:
					trace("rolled");
					gun.roll();
					break;
				case Keyboard.ENTER:
					restart();
				default:
					break;
			}
		}
		
		private function restart():void
		{
			removeChildren();
			init();
		}
		
		public function init():void
		{
			player1 = new Dueller(0xff3030);
			player1.x = 50;
			player1.y = 200;
			
			addChild(player1);

			player2 = new Dueller(0x30ff30);
			player2.x = stage.stageWidth - player2.width;
			player2.y = 200;
			addChild(player2);
			
			gun = new Gun();
			gun.x = stage.stageWidth / 2;
			gun.y = 200;
			addChild(gun);
		}
	}
}