/// @description Insert description here
// You can write your code in this editor
switch (sprite_index)
{
	case sprHermitCrabCloseShell:
	{
		sprite_index = sprHermitCrabInShell;
		image_index = 0;
		
		guard = 1;
		state = hermitCrabState.IN_SHELL;
		waitTime = waitCloseShellMax;
	}	break;
	
	case sprHermitCrabOpenShell:
	{
		sprite_index = sprHermitCrabIdle;
		image_index = 0;
		
		state = hermitCrabState.IDLE;
		waitTime = waitIdleMax;
		guard = 0.5;
		guardDir = 90 + 90 * image_xscale;
	}	break;
	
	case sprHermitCrabShot:
	{
		sprite_index = sprHermitCrabInShell;
		image_index = 0;
		guard = 1;
		
		for (var i = 0; i < array_length(shotBullet); i++)
		{
			shotBullet[i] = false;
		}
		state = hermitCrabState.IN_SHELL;
		waitTime = waitCloseShellMax;
		isCloseShellToShot = false;
	}
}