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
	}
	
	if (event.keyCode == Keyboard.RIGHT && yeti.x >= (768-yeti.width))
	{
		//start moving the background
		//background1.x+=-5; moves all layers at the same speed
		background1.ground.x-=4; 
		background1.clouds.x-=2; 
		background1.mountains.x-=2;
		background1.middle.x-=5;
		background1.mushroomsFront.x-=8;
		background1.snow1.x-=8;
		background1.snow2.x-=8;
		background1.snow3.x-=8;
		
	}
	
	if (event.keyCode==Keyboard.LEFT && yeti.x >= (256+yeti.width))
	{
		yeti.scaleX = -1;
		yeti.x -= movingSpeed;
		yeti.play();
	}
	
	if (event.keyCode==Keyboard.LEFT && yeti.x <= (256+yeti.width))
	{
		background1.ground.x+=4; 
		background1.clouds.x+=2; 
		background1.mountains.x+=2;
		background1.middle.x+=5;
		background1.mushroomsFront.x+=8;
		background1.snow1.x+=8;
		background1.snow2.x+=8;
		background1.snow3.x+=8;
	}
	
	if (event.keyCode==Keyboard.UP)
	{
		yeti.y+15;
		yeti.gotoAndPlay(37);
	}
}

function yetiStops(event:KeyboardEvent):void
{
	yeti.y-15;
	yeti.stop();
	
}
function detectCollision(event:Event):void
{
	if(yeti.hitTestObject(background1.snow1)==true)
	{
		
		background1.snow1.alpha=0;
	}
	if(yeti.hitTestObject(background1.snow2)==true)
	{
		background1.snow2.alpha=0;
	}
	if(yeti.hitTestObject(background1.snow3)==true)
	{
		background1.snow3.alpha=0;
	}
}
