/// @description fncStaticPalSwapInitSystem(shader,enable indexing <optional>)
/// @function fncStaticPalSwapInitSystem
/// @param shader
/// @param enable indexing <optional>
function fncStaticPalSwapInitSystem() {
	//Initiates the palette system.  Call once at the beginning of your game somewhere.
	//---
	//Enabiling "indexing" allows you to use pal_swap_get_pal_color() which will return the rgb color
	//of the given palette.  Additionally, that palette must be indexed.  This is not really recommended,
	//but if you need it, it's there.

	globalvar Pal_Shader,Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture;
	Pal_Shader = argument[0];
	Pal_Texel_Size = shader_get_uniform(argument[0], "texel_size");
	Pal_UVs = shader_get_uniform(argument[0], "palette_UVs");
	Pal_Index = shader_get_uniform(argument[0], "palette_index");
	Pal_Texture = shader_get_sampler_index(argument[0], "palette_texture");

	if(argument_count>1 && argument[1])
	{
	    globalvar Pal_Map;
	    Pal_Map = ds_map_create();
	}
}

/// @description fncStaticPalSwapReset();
/// @function fncStaticPalSwapReset
function fncStaticPalSwapReset() {
	//Simple shader reset.  You can just use shader_reset if you prefer.
	shader_reset();


}

/// @description fncStaticPalSwapSet(palette_sprite_index, palette_index,palette is surface);
/// @function fncStaticPalSwapSet
/// @param palette_sprite_index
/// @param  palette_index
/// @param palette is surface
function fncStaticPalSwapSet() {
	shader_set(Pal_Shader);
	var _pal_sprite=argument[0];
	var _pal_index=argument[1];

	if(!argument[2])
	{   //Using a sprite based palette

	    var tex = sprite_get_texture(_pal_sprite, 0);
	    var UVs = sprite_get_uvs(_pal_sprite, 0);
    
	    texture_set_stage(Pal_Texture, tex);
	    gpu_set_texfilter_ext(Pal_Texture, 0);
    
	    var texel_x = texture_get_texel_width(tex);
	    var texel_y = texture_get_texel_height(tex);
	    var texel_hx = texel_x * 0.5;
	    var texel_hy = texel_y * 0.5;
    
	    shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
	    shader_set_uniform_f(Pal_UVs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
	    shader_set_uniform_f(Pal_Index, _pal_index);
	}
	else
	{   //Using a surface based palette
	    var tex = surface_get_texture(_pal_sprite);
    
	    texture_set_stage(Pal_Texture, tex);
	    gpu_set_texfilter_ext(Pal_Texture, 0);
    
	    var texel_x = texture_get_texel_width(tex);
	    var texel_y = texture_get_texel_height(tex);
	    var texel_hx = texel_x * 0.5;
	    var texel_hy = texel_y * 0.5;
    
	    shader_set_uniform_f(Pal_Texel_Size, texel_x, texel_y);
	    shader_set_uniform_f(Pal_UVs, texel_hx, texel_hy, 1.0+texel_hx, 1.0+texel_hy);
	    shader_set_uniform_f(Pal_Index, _pal_index);
	}
}