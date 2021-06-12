/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

waitTime = 20;

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
			if (sprite_index != sprHellBatChangeDir)
			{
				if (instance_exists(objGlobalManager.currentPlayer))
				{
					if (image_xscale != sign(objGlobalManager.currentPlayer.x - self.x))
					{
						sprite_index = sprHellBatChangeDir;
						image_index = 0;
					}
				}
			}
			other.waitTime -= TIME_SCALE;
		}
		else
		{
			if (sprite_index != sprHellBatChangeDir)
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
}

function fncStateEnd()
{
	
}