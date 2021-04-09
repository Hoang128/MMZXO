/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 60;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter idle state");
	
	with(core.id)
	{
		sprite_index = sprHellBatFly;
		image_index = 0;
	}
}

function fncStateRun()
{
	with (core.id)
	{
		if (other.waitTime > 0)
		{
			other.waitTime -= TIME_SCALE;
		}
		else
		{
			fncChooseMove();
			fncDoMove();
		}
	}
}

function fncStateEnd()
{
}

function fncChooseMove()
{
	
}

function fncDoMove()
{
	
}