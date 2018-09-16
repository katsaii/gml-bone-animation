/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
array_unhook_sk_structure(argument0);
// iterate through subtextures and dispose
var sk_atlas_subtextures = argument0[SK_ATLAS.subTextureMap];
var sk_region_count = ds_map_size(sk_atlas_subtextures);
var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
repeat(sk_region_count){
	var sk_region = sk_atlas_subtextures[? sk_region_key];
	if(sk_struct_exists(sk_region)){
		sk_struct_destroy(sk_region);
	}
	// goto to next region
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}
// destroy dynamic data structures
ds_map_destroy(sk_atlas_subtextures);