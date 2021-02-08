/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

weaponSlash = noone;
core = noone;
enableNextSFX = true;

function fncCreateMeleeWeapon(object, sprite)
{
	if (instance_exists(core))
	{
		if (weaponSlash == noone)
		{
			weaponSlash = instance_create_depth(x, y, core.depth - 1, object);
			weaponSlash.core = self;
			weaponSlash.sprite_index = sprite;
		}
	}
}

function fncDestroyMeleeWeapon()
{
	if ((weaponSlash != noone) && instance_exists(weaponSlash.id))
	{
		instance_destroy(weaponSlash);
		weaponSlash = noone;
	}
}

function fncChangeMeleeWeapon(object, sprite, syncAction)
{
	var syncFrame = 0;
	if (syncAction)
		syncFrame = weaponSlash.image_index;
	fncDestroyMeleeWeapon();
	fncCreateMeleeWeapon(object, sprite);
	object.image_index = syncFrame;
}