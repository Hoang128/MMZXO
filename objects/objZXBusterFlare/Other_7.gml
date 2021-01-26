/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprZXBusterC2FlareStart:
	{
		sprite_index = sprZXBusterC2Flare;
		image_index = 0;
	}	break;
	case sprZXBusterC2FlareEnd:
	{
		instance_destroy();
	}	break;
}