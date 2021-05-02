/// @description Insert description here
// You can write your code in this editor
switch (playerStateMachine.currentState)
{
	default: image_xscale = charDir;	break;
}

switch (sprite_index)
{
	case sprPlayer.sprIdle:			imgSpd = 0.15;				break;
	case sprPlayer.sprRun:			imgSpd = 0.5;				break;
	case sprPlayer.sprJumpStart:	imgSpd = 1;					break;
	case sprPlayer.sprJump:			imgSpd = 1;					break;
	case sprPlayer.sprFallStart:	imgSpd = 1;					break;
	case sprPlayer.sprFall:			imgSpd = 1;					break;
	case sprPlayer.sprLand:			imgSpd = 1;					break;
	case sprPlayer.sprClimb:		imgSpd = 0.5 * -climbDir;	break;
	case sprPlayer.sprClimbEnd:		imgSpd = 0;					break;
	case sprPlayer.sprDashEnd:		imgSpd = 0.5;				break;
	case sprPlayer.sprStand:		imgSpd = 0.1;				break;
	default:						imgSpd = 0.5;
}

switch (sprite_index)
{
	case sprPlayer.sprDash:			mask_index = sprPlayerHitboxLow;	break;
	default:						mask_index = sprPlayerHitbox;		break;
}