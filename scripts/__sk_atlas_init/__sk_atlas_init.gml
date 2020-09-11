#macro SK_TYPE_ATLAS "atlas"
enum sk_data_atlas{
	texturePage,
	UVLeft,UVTop,
	UVRight,UVBottom,
	subtextures
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_atlas.subtextures] = ds_map_create();
sk_atlas_set_page(argument0,-1,0);