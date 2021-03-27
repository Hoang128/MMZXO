/// @description Insert description here
// You can write your code in this editor

if (!ds_list_empty(flareList))
{
	//var flare = ds_list_find_value(flareList, 0);
	//var dirEnd = flare.dir;
	
	for(var i = 0; i < flareNumber; i++)
	{
		var flare = ds_list_find_value(flareList, i);
		instance_destroy(flare);
		
		//flare.dirEnd = dirEnd;
		//flare.destroyOutScreen = true;
		//flare.hspd = coreHspd;
	}
}

ds_list_clear(flareList);
ds_list_destroy(flareList);
flareList = -1;