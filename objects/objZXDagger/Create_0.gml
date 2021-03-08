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

function fncSetupResources()
{
	switch (sprite_index)
	{
		case sprZXSlashDashHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashDashImg;	
		}	break;
		case sprZXSlashClimbHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashClimbImg;
		}	break;
		case sprZXSlashJumpHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashJumpImg;
		}	break;
		case sprZXSlashRunHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashRunImg;
		}	break;
		case sprZXSlashSlideHitbox:				
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashSlideImg;
		}	break;
		case sprZXSlashSpinHitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashSpinImg;
		}	break;
		case sprZXSlashCombo1Hitbox:
		{
			sfx = vfxVentSlash1;
			spriteWeapon = sprZXSlashCombo1Img;
		}	break;
		case sprZXSlashCombo2Hitbox:			
		{
			sfx = vfxVentSlash2;
			spriteWeapon = sprZXSlashCombo2Img;		
		}	break;
		case sprZXSlashCombo3Hitbox:
		{
			sfx = vfxVentSlash3;
			spriteWeapon = sprZXSlashCombo3Img;
		}	break;
		case sprZXSlashChargeGroundHitbox:
		{
			sfx = vfxVentSlashCharge;
			spriteWeapon = sprZXSlashChargeGroundImg;
		}	break;
		case sprZXSlashChargeJumpHitbox:
		{
			sfx = vfxVentSlashCharge;
			spriteWeapon = sprZXSlashChargeJumpImg;		
		}	break;
		case sprZXSlashChargeSlideHitbox:
		{
			sfx = vfxVentSlashCharge;
			spriteWeapon = sprZXSlashChargeSlideImg;	
		}	break;
		case sprZXSlashChargeClimbHitbox:
		{
			sfx = vfxVentSlashCharge;
			spriteWeapon = sprZXSlashChargeClimbImg;		
		}	break;
	}
}