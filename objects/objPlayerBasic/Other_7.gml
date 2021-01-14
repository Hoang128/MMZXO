/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case sprPlayer.sprJumpStart:
	{
		sprite_index = sprPlayer.sprJump;
		image_index = 0;
		break;
	}
	case sprPlayer.sprFallStart:
	{
		sprite_index = sprPlayer.sprFall;
		image_index = 0;
		break;
	}
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
	}	break;
	case sprPlayer.sprWallKick:
	{
		sprite_index = sprPlayer.sprJump;
		image_index = 0;
	}
}