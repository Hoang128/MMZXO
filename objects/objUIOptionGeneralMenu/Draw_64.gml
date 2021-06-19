/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (phase == 3)
{
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	
	draw_set_font(UIContext.childFont);
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(UIBackground.xStart + 1050 + UIContext.shadowDistance, UIBackground.yStart + 220 + UIContext.shadowDistance,round(global.emitterSFX.volume * 10));
	}
	
	draw_set_color(c_white);
	draw_text(UIBackground.xStart + 1050, UIBackground.yStart + 220, round(global.emitterSFX.volume * 10));
	draw_set_color(c_white);
	
	if (UIContext.shadow)
	{
		draw_set_color(c_black);
		draw_text(UIBackground.xStart + 1050 + UIContext.shadowDistance, UIBackground.yStart + 480 + UIContext.shadowDistance, round(global.emitterBGM.volume * 10));
	}
	
	draw_set_color(c_white);
	draw_text(UIBackground.xStart + 1050, UIBackground.yStart + 480, round(global.emitterBGM.volume * 10));
	draw_set_color(c_white);
}