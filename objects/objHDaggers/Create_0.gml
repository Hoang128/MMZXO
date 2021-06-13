/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 1.5;
inited = false;

function fncChangeImgSpd()
{
	switch (sprite_index)
	{
		case sprHSlashDashHitbox:
		case sprHSlashDashAirHitbox:
		case sprHSlashClimbHitbox:
		case sprHSlashRunHitbox:
			imgSpd = 1.5;	break;
		case sprHSlashSlideHitbox:
			imgSpd = 1.5;	break;
		case sprHSlashJumpHitbox:
			imgSpd = 1.5;	break;
		
	}
}

function fncSetupResources()
{
	switch (sprite_index)
	{
		case sprHSlashDashHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashDashImg;	
		}	break;
		case sprHSlashDashAirHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashDashAirImg;
		}	break;
		case sprHSlashClimbHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashClimbImg;
		}	break;
		case sprHSlashJumpHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashJumpImg;
		}	break;
		case sprHSlashRunHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashRunImg;
		}	break;
		case sprHSlashSlideHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlashSlideImg;
		}	break;
		case sprHSlash1Hitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprHSlash1Img;
		}	break;
		case sprHSlash2Hitbox:
		{
			sfx = vfxVentSlash2;
			spriteWeapon = sprHSlash2Img;
		}	break;
		case sprHSlashDoubleHitbox:
		{
			sfx = vfxVentSlash3;
			spriteWeapon = sprHSlashDoubleImg;
		}	break;
	}
}