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
			sfx = vfxModelHSlashDouble;
			spriteWeapon = sprHSlashDashImg;	
		}	break;
		case sprHSlashDashAirHitbox:
		{
			sfx = vfxModelHSlashDouble;
			spriteWeapon = sprHSlashDashAirImg;
		}	break;
		case sprHSlashClimbHitbox:				
		{
			sfx = vfxModelHSlashH;
			spriteWeapon = sprHSlashClimbImg;
		}	break;
		case sprHSlashJumpHitbox:
		{
			sfx = vfxModelHSlashH;
			spriteWeapon = sprHSlashJumpImg;
		}	break;
		case sprHSlashRunHitbox:
		{
			sfx = vfxModelHSlashH;
			spriteWeapon = sprHSlashRunImg;
		}	break;
		case sprHSlashSlideHitbox:				
		{
			sfx = vfxModelHSlashH;
			spriteWeapon = sprHSlashSlideImg;
		}	break;
		case sprHSlash1Hitbox:
		{
			sfx = vfxModelHSlashH;
			spriteWeapon = sprHSlash1Img;
		}	break;
		case sprHSlash2Hitbox:
		{
			sfx = vfxModelHSlashV;
			spriteWeapon = sprHSlash2Img;
		}	break;
		case sprHSlashDoubleHitbox:
		{
			sfx = vfxModelHSlashSonic;
			spriteWeapon = sprHSlashDoubleImg;
		}	break;
	}
}