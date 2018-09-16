#macro sk_debug_atlas_texture (1<<16)
#macro sk_debug_atlas_regions (1<<17)
#macro sk_debug_atlas_regionNames (1<<18)
#macro sk_debug_atlas_regionOrigins (1<<19)
/// @desc draws the atlas and its regions
///		| NOTE: if you are using a texture which has been cropped or is not a power of two, then it will be incorrectly represented...
///		|		this does not mean that your UVs are incorrect, it just means that what is displayed is inaccurate.
/// @param atlas
/// @param x
/// @param y
/// @param w
/// @param h
/// @param debugArgs
var sk_atlas_subtextures = argument0[SK_ATLAS.subTextureMap];
var sk_atlas_texture = argument0[SK_ATLAS.texturePage];
var sk_x1 = argument1;
var sk_y1 = argument2;
var sk_x2 = sk_x1+argument3;
var sk_y2 = sk_y1+argument4;
if(argument5&sk_debug_atlas_texture){
	// draw texture
	draw_primitive_begin_texture(pr_trianglestrip,sk_atlas_texture);
	draw_vertex_texture_colour(sk_x1,sk_y1,0,0,c_white,1);
	draw_vertex_texture_colour(sk_x1,sk_y2,0,1,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y1,1,0,c_white,1);
	draw_vertex_texture_colour(sk_x2,sk_y2,1,1,c_white,1);
	draw_primitive_end();
}
// draw regions
var sk_region_count = ds_map_size(sk_atlas_subtextures);
var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
repeat(sk_region_count){
	var sk_region = sk_atlas_subtextures[? sk_region_key];
	if(sk_struct_isof(sk_region,sk_type_region)){
		// get positions
		var ULX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_ULX]);
		var ULY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_ULY]);
		var URX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_URX]);
		var URY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_URY]);
		var BLX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_BLX]);
		var BLY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_BLY]);
		var BRX = lerp(sk_x1,sk_x2,sk_region[SK_REGION.uv_BRX]);
		var BRY = lerp(sk_y1,sk_y2,sk_region[SK_REGION.uv_BRY]);
		// get origin
		var OX = lerp(ULX,BRX,sk_region[SK_REGION.ox]/max(sk_region[SK_REGION.width],1));
		var OY = lerp(ULY,BRY,sk_region[SK_REGION.oy]/max(sk_region[SK_REGION.height],1));
		// draw polygon
		draw_primitive_begin(pr_linelist);
		if(argument5&sk_debug_atlas_regions){
			draw_vertex_colour(BLX,BLY,c_blue,1); // left
			draw_vertex_colour(ULX,ULY,c_blue,1);
			draw_vertex_colour(ULX,ULY,c_yellow,1); // top
			draw_vertex_colour(URX,URY,c_yellow,1);
			draw_vertex_colour(BRX,BRY,c_blue,1); // right
			draw_vertex_colour(URX,URY,c_blue,1);
			draw_vertex_colour(BLX,BLY,c_blue,1); // bottom
			draw_vertex_colour(BRX,BRY,c_blue,1);
		}
		if(argument5&sk_debug_atlas_regionOrigins){
			draw_vertex_colour(ULX,ULY,c_green,1); // origin
			draw_vertex_colour(OX,OY,c_green,1);
		}
		draw_primitive_end();
		if(argument5&sk_debug_atlas_regionNames){
			draw_text(OX,OY,sk_struct_get_name(sk_region));
		}
	}
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}