scale += (keyboard_check(vk_right) - keyboard_check(vk_left)) * 0.01;

if (keyboard_check_pressed(ord("R"))) scale = 1;

if (keyboard_check_pressed(vk_space)) mode = !mode;

if (keyboard_check_pressed(vk_escape)) game_end();

x += (keyboard_check(ord("A")) - keyboard_check(ord("D"))) * 4;
y += (keyboard_check(ord("W")) - keyboard_check(ord("S"))) * 4;

