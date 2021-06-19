/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
surfPause = noone;

function fncDrawPauseScreen()
{
	/// @description  Create surface, draw everything to it, deactivate all other instances, create UI
	depth = -5000;

	surfPause = surface_create(VIEW_W, VIEW_H);
	// Makes the surface the size of the view.


	surface_set_target(surfPause);
	draw_clear_alpha(c_black, 0); // Clears surface.

	with(all) 
	{
		if (visible == true) && collision_rectangle(VIEW_X, VIEW_Y, VIEW_X + VIEW_W, VIEW_Y + VIEW_H, self, 0, 0)
		{
			x = x - VIEW_X;  y = y - VIEW_Y; // Moves all instances to the top left corner, so they will appear in the correct place on the surface
			event_perform(ev_draw,0);
			x = x + VIEW_X;  y = y + VIEW_Y; // Move the instances back to their original spot. 
		} 
	}   // Draws every visible instance to surface.

	surface_reset_target();
	instance_deactivate_all(true);
	instance_activate_object(objUI);
	instance_activate_object(objGameManager);
}

fncDrawPauseScreen();