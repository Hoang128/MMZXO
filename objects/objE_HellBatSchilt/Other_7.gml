/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprHellBatFlyDownStart:
	{
		sprite_index = sprHellBatFlyDown;
		image_index = 0;
	}	break;
	
	case sprHellBatLand:
	{
		sprite_index = sprHellBatStand;
		image_index = 0;
	}	break;
	
	case sprHellBatSpamBatStart:
	{
		sprite_index = sprHellBatSpamBat;
		image_index = 0;
	}	break;
	
	case sprHellBatSpamBatEnd:
	{
		sprite_index = sprHellBatFly;
		image_index = 0;
		
		with (bossStateMachine)
		{
			fncStateDequeue();
		}
	}	break;
	
	case sprHellBatSpamSonicStart:
	{
		sprite_index = sprHellBatSpamSonic;
		image_index = 0;
	}	break;
	case sprHellBatSpamSonicEnd:
	{
		sprite_index = sprHellBatFly;
		image_index = 0;
		
		with (bossStateMachine)
		{
			fncStateDequeue();
		}
	}	break;
}