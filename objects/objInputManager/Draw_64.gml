draw_set_halign(fa_right);
draw_set_font(fontDebug);
var _num = 0;
for (var i = 0; i < 12; i++;)
{
var xx = 1920 - 32;
var yy = 32 + (160 * _num);
if gamepad_is_connected(i)
    {
    _num++;
    draw_text(xx, yy, "Gamepad Slot - " + string(i));
    draw_text(xx, yy + 32, "Gamepad Type - " + string(gamepad_get_description(i)));
    draw_text(xx, yy + 64, "Left H Axis - " + string(gamepad_axis_value(i, gp_axislh)));
    draw_text(xx, yy + 96, "Left V Axis - " + string(gamepad_axis_value(i, gp_axislv)));
    draw_text(xx, yy + 128, "Right H Axis - " + string(gamepad_axis_value(i, gp_axisrh)));
    draw_text(xx, yy + 160, "Right V Axis - " + string(gamepad_axis_value(i, gp_axisrv)));   
    draw_text(xx, yy + 192, "Fire Rate - " + string(gamepad_button_value(i, gp_shoulderrb)));
    }
}