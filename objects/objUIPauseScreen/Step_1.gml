/// @description  Redraw surface

if (!surface_exists(surfPause))
{  
	// Make sure surface exists - if game loses focus, the surface can sometimes be lost.
    // If the surface gets lost, the following recreates it and redraws all the instances.
    instance_activate_all(); // Activate all the instances again just for 1 step so they can be redrawn to the surface.
     // The instances must appear to the screen for 1 step to be redrawn.
	alarm[0] = 1;
}