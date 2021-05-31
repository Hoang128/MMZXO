/// @description Insert description here
// You can write your code in this editor

if (visible)
{
	draw_sprite_ext(sprite_index, image_index, x + sprProp.x, y + sprProp.y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

	if ((inviTime > 0) && (blinkTime > (blinkTimeMax / 2)))
	{
		draw_set_alpha(0.8);
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index, image_index, x + sprProp.x, y + sprProp.y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
	}

	if (sprProp.blendTime > 0)
	{
		for (var i = 0; i < sprProp.blendTime; i++)
		{
			gpu_set_blendmode(bm_add);
			draw_sprite_ext(sprite_index, image_index, x + sprProp.x, y + sprProp.y, image_xscale, image_yscale, image_angle, sprProp.blendColor, image_alpha);
			gpu_set_blendmode(bm_normal);
		}
	}
}

if (instance_exists(objDebug))
{
	if (objDebug.physicVisible.player)
		draw_sprite_ext(mask_index,0,x,y,1,1,0,c_white,1);
}

/*
draw_set_font(fontDebugS);
draw_set_halign(fa_center);
draw_text(x, y + 8, "HP = " + string(hp));
draw_text(x, y + 16, "depth = " + string(depth));