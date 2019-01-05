SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
#macro SK_ATLAS_DEBUG_TEXTURE (1<<0)
#macro SK_ATLAS_DEBUG_REGIONS (1<<1)
#macro SK_ATLAS_DEBUG_KEYS (1<<2)
#macro SK_ATLAS_DEBUG_ORIGINS (1<<3)
/// @desc draws the atlas and its regions
///		| NOTE: if you are using a texture which has been cropped or is not a power of two, then it will be incorrectly represented...
///		|		this does not mean that your UVs are incorrect, it just means that what is displayed is inaccurate.
/// @param atlas
/// @param x
/// @param y
/// @param w
/// @param h
/// @param debugArgs
var sk_atlas_subtextures = argument0[sk_atlas.subtextures];
var sk_atlas_texture = argument0[sk_atlas.texturePage];
var sk_x1 = argument1;
var sk_y1 = argument2;
var sk_x2 = sk_x1+argument3;
var sk_y2 = sk_y1+argument4;
if(argument5&SK_ATLAS_DEBUG_TEXTURE){
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
	// get positions
	var ULX = lerp(sk_x1,sk_x2,sk_region[0]);
	var ULY = lerp(sk_y1,sk_y2,sk_region[1]);
	var URX = lerp(sk_x1,sk_x2,sk_region[2]);
	var URY = lerp(sk_y1,sk_y2,sk_region[3]);
	var BLX = lerp(sk_x1,sk_x2,sk_region[4]);
	var BLY = lerp(sk_y1,sk_y2,sk_region[5]);
	var BRX = lerp(sk_x1,sk_x2,sk_region[6]);
	var BRY = lerp(sk_y1,sk_y2,sk_region[7]);
	// get origin
	var OX = lerp(ULX,BRX,sk_region[8]/max(sk_region[10],1));
	var OY = lerp(ULY,BRY,sk_region[9]/max(sk_region[11],1));
	// draw polygon
	draw_primitive_begin(pr_linelist);
	if(argument5&SK_ATLAS_DEBUG_REGIONS){
		draw_vertex_colour(BLX,BLY,c_blue,1); // left
		draw_vertex_colour(ULX,ULY,c_blue,1);
		draw_vertex_colour(ULX,ULY,c_yellow,1); // top
		draw_vertex_colour(URX,URY,c_yellow,1);
		draw_vertex_colour(BRX,BRY,c_blue,1); // right
		draw_vertex_colour(URX,URY,c_blue,1);
		draw_vertex_colour(BLX,BLY,c_blue,1); // bottom
		draw_vertex_colour(BRX,BRY,c_blue,1);
	}
	if(argument5&SK_ATLAS_DEBUG_ORIGINS){
		draw_vertex_colour(ULX,ULY,c_green,1); // origin
		draw_vertex_colour(OX,OY,c_green,1);
	}
	draw_primitive_end();
	if(argument5&SK_ATLAS_DEBUG_KEYS){
		draw_text(OX,OY,sk_region_key);
	}
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}