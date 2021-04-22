/// @description Insert description here
// You can write your code in this editor
if (inited == 0)
{
	messArr[0].inited = 0;
	inited = 1;
}
else
{
	if (messChain == 0)
	{
		instance_destroy();
	}
	else
	{
		if (!instance_exists(messArr[messCurrent]))
		{
			if (messCurrent < messChain - 1)
			{
				messCurrent++;
				messArr[messCurrent].inited = 0;
			}
			else
				instance_destroy();
		}
	}
}
