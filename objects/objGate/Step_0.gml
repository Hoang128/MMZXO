/// @description Insert description here
// You can write your code in this editor
switch (state)
{
	//Init
	case 0:
	{
		fncGateCreateBlock();
		state = 1;
	}	break;
	
	//Close
	case 1:
	{
		if (fncCanBeOpen(objGlobalManager.currentPlayer))
		{
			show_debug_message("can be open!");
			with (objGlobalManager.currentPlayer)
			{
				with (playerStateMachine)
					fncStateChange(objPlayerStatePassGatePlatform);
			}
			global.gameState = GameState.INGAME_CUTSCENE;
			sprite_index = sprGateOpening;
			image_index = 0;
			state = 2;
		}
	}	break;
	
	//Open
	case 3:
	{
		if (!place_meeting(x, y, objPlayerBasic))
		{
			sprite_index = sprGateClosing;
			image_index = 0;
			state = 4;
		}
	}	break;
}