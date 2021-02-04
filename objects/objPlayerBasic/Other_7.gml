/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case sprPlayer.sprJumpStart:
	{
		sprite_index = sprPlayer.sprJump;
		image_index = 0;
		
	}	break;
	case sprPlayer.sprFallStart:
	{
		sprite_index = sprPlayer.sprFall;
		image_index = 0;
		
	}	break;
	case sprPlayer.sprLand:
	{
		sprite_index = sprPlayer.sprIdle;
		image_index = 0;
	}	break;
	case sprPlayer.sprDashStart:
	{
		sprite_index = sprPlayer.sprDash;
		image_index = 0;
	}	break;
	case sprPlayer.sprDashEnd:
	{
		sprite_index = sprPlayer.sprIdle;
		image_index = 0;
	}	break;
	case sprPlayer.sprSlideStart:
	{
		sprite_index = sprPlayer.sprSlide;
		image_index = 0;
		
		if (playerStateMachine.currentState.slideEff == noone)
		{
			playerStateMachine.currentState.slideEff 
			= instance_create_depth(x + charDir * 12, y + 4, depth - 1, objPlayerSlideEff);
			playerStateMachine.currentState.slideEff.core 
			= self.id;
		}
	}	break;
	case sprPlayer.sprWallKick:
	{
		sprite_index = sprPlayer.sprJumpStart;
		image_index = 1;
	}	break;
	case sprPlayer.sprClimbStart:
	{
		sprite_index = sprPlayer.sprClimb;
		image_index = 0;
	}	break;
}