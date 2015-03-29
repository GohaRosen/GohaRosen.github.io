import flash.events.KeyboardEvent;
import flash.events.Event;


stage.addEventListener(KeyboardEvent.KEY_DOWN, yetiWalking);
stage.addEventListener(KeyboardEvent.KEY_UP, yetiStops);
stage.addEventListener(Event.ENTER_FRAME, detectCollision);

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
function detectCollision(event:Event):void
{
<<<<<<< HEAD
	if(yeti.hitTestObject(snow1)==true)
	{
		trace("yeti hit the snow");
	}
	if(yeti.hitTestObject(snow2)==true)
	{
		trace("yeti hit the snow");
	}
	if(yeti.hitTestObject(snow3)==true)
=======
	if(yeti.hitTestObject(snow)==true)
>>>>>>> origin/master
	{
		trace("yeti hit the snow");
	}
}
