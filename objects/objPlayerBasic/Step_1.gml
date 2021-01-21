/// @description Insert description here
// You can write your code in this editor
switch (playerStateMachine.currentState)
{
	default: image_xscale = charDir;	break;
}

switch (sprite_index)
{
	case sprPlayer.sprIdle:			image_speed = 0.15;				break;
	case sprPlayer.sprRun:			image_speed = 0.5;				break;
	case sprPlayer.sprJumpStart:	image_speed = 0.5;				break;
	case sprPlayer.sprJump:			image_speed = 0.5;				break;
	case sprPlayer.sprFallStart:	image_speed = 0.5;				break;
	case sprPlayer.sprFall:			image_speed = 0.5;				break;
	case sprPlayer.sprLand:			image_speed = 0.5;				break;
	case sprPlayer.sprClimb:		image_speed = 0.5 * climbDir;	break;
	case sprPlayer.sprClimbEnd:		image_speed = 0;				break;
	case sprPlayer.sprDashEnd:
	{
		if (image_index < 1)		image_speed = 0.5;
		else						image_speed = 0;
	}																break;
	default:						image_speed = 0.5;
}

switch (sprite_index)
{
	case sprPlayer.sprDash:			mask_index = sprPlayerHitboxLow;	break;
	default:						mask_index = sprPlayerHitbox;		break;
}