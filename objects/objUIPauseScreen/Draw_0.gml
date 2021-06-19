/// @description Insert description here
// You can write your code in this editor
/// @description  Draw the surface to the screen

if (surface_exists(surfPause))
{  // Make sure surface exists - if game loses focus, the surface can sometimes be lost.
    draw_surface(surfPause, VIEW_X, VIEW_Y);
}
else
{
	// If the surface gets lost, the following recreates it and redraws all the instances.
	instance_activate_all(); // Activate all the instances again just for 1 step so they can be redrawn to the surface.
	    // The instances must appear to the screen for 1 step to be redrawn.
	alarm[0] = 1;
}

