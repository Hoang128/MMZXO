/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 30;

function fncStateStart()
{
	show_debug_message("hell bat schilt enter idle state");
	
	with(core.id)
	{
		sprite_index = sprHellBatFly;
		image_index = 0;
		
		fncChangeDirToPlayer(objGlobalManager.currentPlayer);
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
			with (other)
			{
				with (core.id)
				{
					fncChooseMove();
				}
				fncDoDequeueMove();
				if (core.id.lastMove == "release sonic")
				{
					stateMachine.currentState.customTele = "release sonic";
				}
				else if (core.id.lastMove == "shot down")
				{
					stateMachine.currentState.customTele = "shot down";
				}
				else if (core.id.lastMove == "thunder clap")
				{
					stateMachine.currentState.spaceToEarth = 0;
				}
			}
		}
	}
}

function fncStateEnd()
{
	
}