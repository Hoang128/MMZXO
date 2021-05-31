/// @description Draw
if (sprite_index != noone)
{
	

	if (palette != noone)
		fncStaticPalSwapSet(palette, paletteNumber, false);

	if (sprite_index != noone)
		draw_self();
	
	if (blink > blinkMax / 2)
	{
		draw_set_alpha(0.8);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}
	
	if (palette != noone)
		fncStaticPalSwapReset();
}

/*
draw_set_font(fontDebugS);
draw_set_halign(fa_center);
draw_text(x, y + 8, "HP = " + string(hp));