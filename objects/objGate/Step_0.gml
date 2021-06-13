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
			fncGateOpen();
		}
	}	break;
	
	//Open
	case 3:
	{
		fncGateCloseStart();
	}	break;
}