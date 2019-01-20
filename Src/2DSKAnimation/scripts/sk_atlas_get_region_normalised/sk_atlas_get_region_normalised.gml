__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc returns the region array, but normalised to the texture uvs
/// @param atlas
/// @param key
var sk_region = ds_map_find_value(argument0[sk_data_atlas.subtextures],argument1);
if(sk_region!=undefined){
	var sk_uvleft = argument0[sk_data_atlas.UVLeft];
	var sk_uvtop = argument0[sk_data_atlas.UVTop];
	var sk_uvright = argument0[sk_data_atlas.UVRight];
	var sk_uvbottom = argument0[sk_data_atlas.UVBottom];
	return [
		lerp(sk_uvleft,sk_uvright,sk_region[0]),
		lerp(sk_uvtop,sk_uvbottom,sk_region[1]),
		lerp(sk_uvleft,sk_uvright,sk_region[2]),
		lerp(sk_uvtop,sk_uvbottom,sk_region[3]),
		lerp(sk_uvleft,sk_uvright,sk_region[4]),
		lerp(sk_uvtop,sk_uvbottom,sk_region[5]),
		lerp(sk_uvleft,sk_uvright,sk_region[6]),
		lerp(sk_uvtop,sk_uvbottom,sk_region[7]),
		sk_region[8],
		sk_region[9],
		sk_region[10],
		sk_region[11]
	];
}	return undefined;