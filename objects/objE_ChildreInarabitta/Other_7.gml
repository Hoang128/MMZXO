/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case sprCInarabitta_TurnAround:
	{
		sprite_index = sprCInarabitta_Idle;
		image_index = 0;
		image_xscale *= -1;
	}	break;
	
	case sprCInarabitta_LaunchMissleStart:
	{
		sprite_index = sprCInarabitta_LaunchMissle;
		image_index = 0;
	}	break;
	case sprCInarabitta_LaunchMissle:
	{
		if (bossStateMachine.currentState.missleNumber > 0)
		{
			bossStateMachine.currentState.missleNumber--;
			bossStateMachine.currentState.shot = true;
		}
		else
		{
			sprite_index = sprCInarabitta_LaunchMissleEnd;
		}
	}	break;
	case sprCInarabitta_LaunchMissleEnd:
	{
		bossStateMachine.currentState.changeState = true;
		image_index = 2;
	}	break;
	
	case sprCInarabitta_Land:
	{
		bossStateMachine.currentState.changeToStand = true;
	}	break;
	case sprCInarabitta_JumpToWall:
	{
		sprite_index = sprCInarabitta_IdleWall;
		image_index = 0;
		bossStateMachine.currentState.changeState = true;
	}	break;
	case sprCInarabitta_LandWall:
	{
		bossStateMachine.currentState.changeToStand = true;
	}	break;
	
	case sprCInarabitta_DrillDownEnd:
	{
		bossStateMachine.currentState.changeState = true;
		image_index = 6;
		
		with (bossStateMachine.currentState)
			fncCreateIceSpike();
	}	break;
	
	case sprCInarabitta_SlashArrow:
	{
		bossStateMachine.currentState.changeState = true;
		image_index = 11;
	}	break;
}