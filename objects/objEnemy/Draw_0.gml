/// @description Draw
if (sprite_index != noone)
{
	if (blink > blinkMax / 2)
		gpu_set_blendmode(bm_add);

	if (palette != noone)
		fncStaticPalSwapSet(palette, paletteNumber, false);

	if (sprite_index != noone)
		draw_self();

	if (palette != noone)
		fncStaticPalSwapReset();
	
	if (gpu_get_blendmode() == bm_add)
		gpu_set_blendmode(bm_normal);
}