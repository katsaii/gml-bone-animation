/// @desc destructor
/// @param struct
var sk_atlas_subtextures = argument0[SK_ATLAS.subTextureMap];
// iterate through subtextures and dispose
var sk_region_count = ds_map_size(sk_atlas_subtextures);
var sk_region_key = ds_map_find_first(sk_atlas_subtextures);
repeat(sk_region_count){
	var sk_region = sk_atlas_subtextures[? sk_region_key];
	if(sk_struct_exists(sk_region,sk_type_region)){
		sk_struct_destroy(sk_region);
	}
	// goto to next region
	sk_region_key = ds_map_find_next(sk_atlas_subtextures,sk_region_key);
}
// destroy final map
ds_map_destroy(sk_atlas_subtextures);