import flash.events.KeyboardEvent;

stage.addEventListener(keyboardEvent.KEY_DOWN, yetiWalking);

function yetiWalking(event:KeyboardEvent):void
{
	if (event.keyCode == keyboard.RIGHT)
	{
		gotoAndPlay();
	}
	if (event.keyCode==keyboard.LEFT)
	{
		gotoAndPlay();
	}
	if (event.keyCode==keyboard.UP)
	{
		gotoAndPlay();
	}
}
