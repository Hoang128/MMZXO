/// @description Insert description here
// You can write your code in this editor
draw_set_valign(fa_bottom);
draw_set_halign(fa_left);

draw_set_color(c_white);
draw_set_font(UIContext.font);

if (UIContext.shadow)
	draw_text(x + UIContext.shadowDistance, y + UIContext.shadowDistance, context);
draw_text(x, y, context);