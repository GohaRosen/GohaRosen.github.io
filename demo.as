import flash.events.KeyboardEvent;


stage.addEventListener(KeyboardEvent.KEY_DOWN, yetiWalking);
stage.addEventListener(KeyboardEvent.KEY_UP, yetiStops);

var movingSpeed:uint=5;

function yetiWalking(event:KeyboardEvent):void
{
	if (event.keyCode == Keyboard.RIGHT && yeti.x <= (768-yeti.width))
	{
		yeti.scaleX = 1;
		yeti.x += movingSpeed;
		yeti.play();
		//start moving the background
	}
	if (event.keyCode==Keyboard.LEFT && yeti.x >= (256+yeti.width))
	{
		yeti.scaleX = -1;
		yeti.x -= movingSpeed;
		yeti.play();
	}
	if (event.keyCode==Keyboard.UP)
	{
		trace("yeti is jumping now");
		/*yeti.gotoAndPlay(37);
		yeti.stop();*/
	}
}

function yetiStops(event:KeyboardEvent):void
{
	yeti.stop();
	
}
