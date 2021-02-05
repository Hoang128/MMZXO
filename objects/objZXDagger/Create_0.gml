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
		case sprZXSlashDashHitbox:
		case sprZXSlashClimbHitbox:
		case sprZXSlashJumpHitbox:
		case sprZXSlashRunHitbox:
			imgSpd = 1.5;	break;
		case sprZXSlashSlideHitbox:
			imgSpd = 1.5;	break;
		
	}
}

function fncSetupSprite()
{
	switch (sprite_index)
	{
		case sprZXSlashDashHitbox:		spriteWeapon = sprZXSlashDashImg;		break;
		case sprZXSlashClimbHitbox:		spriteWeapon = sprZXSlashClimbImg;		break;
		case sprZXSlashJumpHitbox:		spriteWeapon = sprZXSlashJumpImg;		break;
		case sprZXSlashRunHitbox:		spriteWeapon = sprZXSlashRunImg;		break;
		case sprZXSlashSlideHitbox:		spriteWeapon = sprZXSlashSlideImg;		break;
		case sprZXSlashSpinHitbox:		spriteWeapon = sprZXSlashSpinImg;		break;
		case sprZXSlashCombo1Hitbox:	spriteWeapon = sprZXSlashCombo1Img;		break;
		case sprZXSlashCombo2Hitbox:	spriteWeapon = sprZXSlashCombo2Img;		break;
		case sprZXSlashCombo3Hitbox:	spriteWeapon = sprZXSlashCombo3Img;		break;
		
	}
}