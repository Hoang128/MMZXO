/// @description Insert description here
// You can write your code in this editor
draw_set_color(backColor);
draw_rectangle(x + rectPos.x1, y + rectPos.y1, x + rectPos.x2, y + rectPos.y2, false);
draw_triangle(
	x + trianglePos_1.p1.x, y + trianglePos_1.p1.y, 
	x + trianglePos_1.p2.x, y + trianglePos_1.p2.y, 
	x + trianglePos_1.p3.x, y + trianglePos_1.p3.y,
	false);
draw_triangle(
	x + trianglePos_2.p1.x, y + trianglePos_2.p1.y, 
	x + trianglePos_2.p2.x, y + trianglePos_2.p2.y, 
	x + trianglePos_2.p3.x, y + trianglePos_2.p3.y,
	false);
draw_set_color(c_white);

if (cursorOn)
	draw_sprite_ext(imageChar, 0, x, y, imageScale * 1.5, imageScale * 1.5, 0, c_white, 1);
else
	draw_sprite_ext(imageChar, 0, x, y, imageScale, imageScale, 0, c_gray, 1);
