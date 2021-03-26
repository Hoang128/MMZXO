/// @description Insert description here
// You can write your code in this editor

var i = 0;
for (i = 0; i < dustNumberMax; i++)
{
	if (instance_exists(dustList[i]))
		dustList[i].inPool = false;
}