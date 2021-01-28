/// @description Draw
if (sprite_index != noone)
{
	if (blink > blinkMax / 2)
		gpu_set_blendmode(bm_add);

	if (palette != noone)
		scr_PalSwapSet(palette, paletteNumber, false);

	draw_self();

	if (palette != noone)
		scr_PalSwapReset();
	
	if (gpu_get_blendmode() == bm_add)
		gpu_set_blendmode(bm_normal);
}