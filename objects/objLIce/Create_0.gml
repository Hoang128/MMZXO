/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waterInteract = true;
image_xscale = 0;
image_yscale = 0;
scaleSpd = 0.2;
scaleFull = false;
physic.enable = true;
physic.gravAffect = true;
existTime = 180;
firstSlash = noone;

spikeNumber = 4;
spikeAngle = 15;

damage = 1;
maxTimmer = 5;

function fncCreateIceSpike(hDir)
{
	for (var i = 0; i < spikeNumber; i++)
	{
		var objSpike = instance_create_depth(x, y, depth, objLIceSpike);
		objSpike.image_xscale = hDir;
		objSpike.moveDir = (i - (spikeNumber - 1)/2) * spikeAngle;
	}
}