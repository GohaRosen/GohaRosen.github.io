import flash.events.KeyboardEvent;
import flash.events.Event;
import flash.display.Stage;



var movingSpeed:uint=5;
var rightButtonPressed:Boolean = false;
var leftButtonPressed:Boolean = false;
var upButtonPressed:Boolean = false;




stage.addEventListener(KeyboardEvent.KEY_DOWN, yetiWalking);
stage.addEventListener(KeyboardEvent.KEY_UP, yetiStops);
stage.addEventListener(Event.ENTER_FRAME, detectCollision);
stage.addEventListener(Event.ENTER_FRAME, multiKey);





function yetiWalking(event:KeyboardEvent):void
{
	if (event.keyCode == Keyboard.RIGHT && yeti.x <= (768-yeti.width))
	{
		rightButtonPressed = true;
		yeti.scaleX = 1;
		yeti.x += movingSpeed;
		yeti.play();
		
		if (background1.ground.x == -700)
		{
			background1.ground.x = 550;
		}
	}
	
	if (event.keyCode == Keyboard.RIGHT && yeti.x >= (768-yeti.width))
	{
		rightButtonPressed = true;
		
		if (background1.ground.x == -700)
		{
			background1.ground.x = 550;
		}
		
		
		background1.ground.x-=4; 
		background1.clouds.x-=2; 
		background1.mountains.x-=2;
		background1.middle.x-=5;
		background1.mushroomsFront.x-=8;
		background1.snow1.x-=8;
		background1.snow2.x-=8;
		background1.snow3.x-=8;
		yeti.play();
	}
	
	if (event.keyCode==Keyboard.LEFT && yeti.x >= (256+yeti.width))
	{
		leftButtonPressed = true;
		
		yeti.scaleX = -1;
		
		if (background1.ground.x == 680)
		{
			background1.ground.x = -700;
		}
		
		yeti.x -= movingSpeed;
		yeti.play();
	}
	
	if (event.keyCode==Keyboard.LEFT && yeti.x <= (256+yeti.width))
	{
		leftButtonPressed = true;
		yeti.scaleX = -1;
		
		if (background1.ground.x == 680)
		{
			background1.ground.x = -700;
		}
		
		
		background1.ground.x+=4; 
		background1.clouds.x+=2; 
		background1.mountains.x+=2;
		background1.middle.x+=5;
		background1.mushroomsFront.x+=8;
		background1.snow1.x+=8;
		background1.snow2.x+=8;
		background1.snow3.x+=8;
		yeti.play();
		
	}
	
	if (event.keyCode==Keyboard.UP)
	{
		upButtonPressed = true;
		yeti.y+15;
		yeti.gotoAndPlay(37);
	}

}



function yetiStops(event:KeyboardEvent):void
{
	
	rightButtonPressed = false;
	leftButtonPressed = false;
	upButtonPressed = false;
	
	yeti.y-15;
	yeti.gotoAndStop(10);
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



function multiKey (event:Event):void
{
	
	if(rightButtonPressed == true && upButtonPressed == true)
	{
		trace("Right and UP are pressed together");
		yeti.y+15;
		yeti.x+=movingSpeed;
		yeti.play();
		
	}
	if(leftButtonPressed == true && upButtonPressed == true)
	{
		trace("Left and UP are pressed together");
		yeti.y+15;
		yeti.x-=movingSpeed;
		yeti.play();
		
	}
}







