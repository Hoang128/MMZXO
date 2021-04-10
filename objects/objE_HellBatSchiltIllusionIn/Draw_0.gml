if (inviTime > inviMax/2)
{
	draw_sprite_ext(sprite_index, 0, x + distance, y, image_xscale, image_yscale, 0, c_white, alpha);
	draw_sprite_ext(sprite_index, 0, x - distance, y, image_xscale, image_yscale, 0, c_white, 0);
}
else
{
	draw_sprite_ext(sprite_index, 0, x - distance, y, image_xscale, image_yscale, 0, c_white, alpha);
	draw_sprite_ext(sprite_index, 0, x + distance, y, image_xscale, image_yscale, 0, c_white, 0);
}