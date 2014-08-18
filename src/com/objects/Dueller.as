package com.objects
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Dueller extends Sprite
	{
		
		private const diePicture:String = "../assets/resim3.png";
		private var _faceColor:uint;
		public var isDead:Boolean;
		private var _loaderDie    :   Loader     ;
		private var _requestDie    :   URLRequest ;
		
		public function Dueller(bgColor:uint)
		{
			super();
			_loaderDie = new Loader();
			isDead = false;
			_faceColor = bgColor;
			draw();
			addEventListener(Event.REMOVED, onRemove);
		}
		
		protected function onRemove(event:Event):void
		{
			removeEventListener(Event.REMOVED, onRemove);
			graphics.clear();
		}
		
		private function draw():void
		{
			graphics.clear();
			graphics.beginFill(_faceColor);
			graphics.drawCircle(0, 0, 40);
			graphics.endFill();
			graphics.beginFill(0x000000);
			graphics.drawCircle(-15, -10, 5);
			graphics.drawCircle(+15, -10, 5);
			graphics.endFill();
			graphics.lineStyle(2, 0x000000, 100);
			graphics.moveTo(-10,20);
			graphics.curveTo(0,35, 20,15); 
			
		}
		
		public function die():void
		{
			isDead = true;
		   /*
			_requestDie = new URLRequest(diePicture);
			_loaderDie.load(_requestDie);
			addChild(_loaderDie);
			*/
			_faceColor = 0x000000;
			draw();
			
		}
	}
}