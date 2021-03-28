/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 5;
damage = 1;

guardDir = 0;
guard = 0;

damageTimmer = -10;

parent = noone;

bullet = false;
blink = 0;
blinkMax = 8;
blinkTime = 0;
blinkTimeMax = 4;
armor =
{
	neutralArmor : 0,
	fireArmor : 0,
	iceArmor : 0,
	electArmor : 0,
	darkArmor : 0
}
createDestroyEff = true;
destroyEff = objExplosionChain;
explosionCount = 1;
weaponTypeCauseDeath = noone;

destroySlashPiece = noone;
destroyPiece = {sprite : noone, number : 0};

palette = noone;
paletteNumber = 0;


function createCollisionEffectMelee(playerDamageSource)
{
	var randomSpace = 5;
	var pos = {x : self.x, y : self.y};
	pos.x = clamp(playerDamageSource.x + (abs(playerDamageSource.sprite_width) - abs(playerDamageSource.sprite_xoffset)) * 0.75 * playerDamageSource.image_xscale, bbox_left, bbox_right);
	pos.y = clamp((playerDamageSource.core.core.bbox_top + playerDamageSource.core.core.bbox_bottom) / 2, bbox_top, bbox_bottom);
	var objSlash = instance_create_depth(pos.x, pos.y, depth - 1, objMeleeSlashEff);
	objSlash.image_angle = random(randomSpace) * 180 / randomSpace;
}

function fncRealEnemyHandleStep()
{
	if (damageTimmer > 0) damageTimmer -= TIME_SCALE;
	if ((damageTimmer <= 0) && (damageTimmer > -10)) damageTimmer = -10;

	if (blinkTime > 0)
	{
		if (blink > 0) blink -= TIME_SCALE;
		else blink = blinkMax;
		blinkTime -= TIME_SCALE;
	}
	else
	{
		blink = 0;
		blinkTime = 0;
	}

	if (hp <= 0)
		instance_destroy();
}