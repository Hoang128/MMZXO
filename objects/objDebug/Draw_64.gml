/// @description Insert description here
// You can write your code in this editor
draw_set_font(fontDebug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(4, 24, "global time scale = " + string(global.timeScale));
if (instance_exists(objPlayerBasic))
draw_text(4, 48, "player on ground = " + string(objPlayerBasic.physic.onGround));