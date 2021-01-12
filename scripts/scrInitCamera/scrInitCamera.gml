// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrInitCamera()
{
	view_enabled = true;
	view_visible = true;
	view_wport = VPORT_W;
	view_hport = VPORT_H;
	camera_set_view_size(view_camera, VIEW_W, VIEW_H);
	camera_set_view_target(view_camera, self);
	camera_set_view_speed(view_camera, -1, -1);
	camera_set_view_border(view_camera, 180, 80); // Optimized _:3JZ
}