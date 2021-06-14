/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
if (UIText.shadow)
{
	draw_set_color(c_black);
	draw_set_font(UIText.font);
	draw_text(x + UIText.pos.x + UIText.shadowDistance, y + UIText.pos.y + UIText.shadowDistance, UIText.text);
}
draw_set_color(UIText.color);
draw_set_font(UIText.font);
draw_text(x + UIText.pos.x, y + UIText.pos.y, UIText.text);
draw_set_color(c_white);