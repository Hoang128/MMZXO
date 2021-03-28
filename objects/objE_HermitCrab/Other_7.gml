/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprHermitCrabCloseShell:
	{
		sprite_index = sprHermitCrabInShell;
		image_index = 0;
		
		state = hermitCrabState.IN_SHELL;
		waitTime = waitCloseShellMax;
	}	break;
	
	case sprHermitCrabOpenShell:
	{
		sprite_index = sprHermitCrabIdle;
		image_index = 0;
		
		state = hermitCrabState.IDLE;
		waitTime = waitIdleMax;
	}	break;
	
	case sprHermitCrabShot:
	{
		sprite_index = sprHermitCrabInShell;
		image_index = 0;
		
		for (var i = 0; i < array_length(shotBullet); i++)
		{
			shotBullet[i] = false;
		}
		state = hermitCrabState.IN_SHELL;
		waitTime = waitCloseShellMax;
		isCloseShellToShot = false;
	}
}