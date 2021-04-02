switch (mode) {
    case 0:
        better_scaling_draw_sprite(spr_example, 0, x + room_width * 0.5 - sprite_get_width(spr_example) * 0.5 * scale, y + room_height * 0.5 - sprite_get_height(spr_example) * 0.5 * scale, scale, scale, 0, c_white, 1, 5);
        break;

    case 1:
        draw_sprite_ext(spr_example, 0, x + room_width * 0.5 - sprite_get_width(spr_example) * 0.5 * scale, y + room_height * 0.5 - sprite_get_height(spr_example) * 0.5 * scale, scale, scale, 0, c_white, 1);
        break;
}

draw_text(10, 10, string_hash_to_newline("FPS: " + string(fps) + "#WASD to move#Scale (left/right to change, <R> to reset): " + string(scale) + "#Mode (space to toggle): " + mode_name[mode]));

