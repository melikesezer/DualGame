package com.objects
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class Gun extends Sprite
	{
		private const gunImageDestination:String = "../assets/resim.png";
		
		private var _turn:uint; // 0: left, 1:right
		private var _loader    :   Loader     ;
		private var _request    :   URLRequest ;
		
		private var _shootLeft:uint;
		
		public function Gun()
		{
			super();
			addEventListener(Event.REMOVED, onRemove);
			_loader = new Loader();
			draw();
			
			roll();
			
			_turn = 0;
		}
		
		protected function onRemove(event:Event):void
		{
			removeEventListener(Event.REMOVED, onRemove);
			graphics.clear();
			_loader = null;
			_request = null;
		}
		
		private function draw():void
		{
			_request = new URLRequest(gunImageDestination);
			_loader.load(_request);
			addChild(_loader);
		}
		
		private function get turn():uint
		{
			return _turn;
		}
		
		private function changeTurn():void{
			if(_turn == 0)
			{
				rotationY = 180;
				_turn = 1;
			}
			else 
			{
				rotationY = 0;
				_turn = 0;
			}
		}

		public function shoot():int{
			if(_shootLeft > 0)
			{
				trace("click");
				--_shootLeft;
				changeTurn();
			}
			else
			{
				trace("bang");
				return _turn;
			}
			return -1;
		}
		
		public function roll():void{
			_shootLeft = Math.floor(Math.random() * 6 + 1);
		}
	
	}
}