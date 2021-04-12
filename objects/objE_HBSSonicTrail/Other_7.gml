/// @description Insert description here
// You can write your code in this editor

switch (sprite_index)
{
	case sprHellBatSonicTrailL:
	{
			sprite_index = sprHellBatSonicTrailM;
			image_index = 0;
	}	break;
	
	case sprHellBatSonicTrailM:
	{
			sprite_index = sprHellBatSonicTrailS;
			image_index = 0;
	}	break;
	
	case sprHellBatSonicTrailS:
	{

			instance_destroy();

	}	break;
}