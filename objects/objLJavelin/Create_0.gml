/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 1;
inited = false;

function fncChangeImgSpd()
{
	switch (sprite_index)
	{
		case sprLSlashClimbHitbox:
		case sprLSlashJumpHitbox:
			imgSpd = 1.5;	break;
		case sprLSlashSlideHitbox:
			imgSpd = 1.5;	break;
		
	}
}

function fncSetupResources()
{
	switch (sprite_index)
	{
		case sprLSlashClimbHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprLSlashClimbImg;
		}	break;
		case sprLSlashJumpHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprLSlashJumpImg;
		}	break;
		case sprLSlashSlideHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprLSlashSlideImg;
		}	break;
		case sprLSlashStandHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprLSlashStandImg;
		}	break;
		case sprLSlashGigaHitbox:
		{
			sfx = vfxVentSlash2;
			spriteWeapon = sprLSlashGigaImg;
		}	break;
		case sprLSpinDiveHitbox:
		{
			sfx = vfxVentSlash2;
			spriteWeapon = sprLSpinDiveImg;
		}	break;
	}
}