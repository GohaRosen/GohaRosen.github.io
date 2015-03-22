import flash.events.KeyboardEvent;


stage.addEventListener(KeyboardEvent.KEY_DOWN, yetiWalking);
stage.addEventListener(KeyboardEvent.KEY_UP, yetiStops);

var movingSpeed:uint=5;

function yetiWalking(event:KeyboardEvent):void
{
	if (event.keyCode == Keyboard.RIGHT)
	{
		gotoAndPlay(yeti,1);
		yeti.x += movingSpeed;
	}
	if (event.keyCode==Keyboard.LEFT)
	{
		gotoAndPlay();
		yeti.x -= movingSpeed;
	}
	if (event.keyCode==Keyboard.UP)
	{
		gotoAndPlay();
	}
}

function yetiStops(event:KeyboardEvent):void
{
	movingSpeed=0;
}
