/// @description Insert description here
// You can write your code in this editor
if (global.debug)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_set_font(fontMenuS);
	draw_text(1920 - 100, 1080 - 20, string(floor(resultCaculator.timeElapsed * 100)/100));
}