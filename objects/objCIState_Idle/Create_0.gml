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
		physic.enable = true;
		physic.gravAffect = true;
		physic.onGround = true;

		sprite_index = sprCInarabitta_Idle;
		image_index = 0;
		
		//fncChangeDirToPlayer(objGlobalManager.currentPlayer);
	}
}

function fncStateRun()
{
	with (core.id)
	{
		if (other.waitTime > 0)
		{
			other.waitTime -= TIME_SCALE;
			
			if (sprite_index != sprCInarabitta_TurnAround)
			{
				if (instance_exists(objGlobalManager.currentPlayer))
				{
					if (image_xscale != sign(objGlobalManager.currentPlayer.x - self.x))
					{
						sprite_index = sprCInarabitta_TurnAround;
						image_index = 0;
					}
				}
			}
		}
		else
		{
			if (sprite_index == sprCInarabitta_Idle)
			{
				with (other)
				{
					with (core.id)
					{
						fncChooseMove();
					}
					fncDoDequeueMove();
				}
			}
		}
	}
}

function fncStateEnd()
{
	
}