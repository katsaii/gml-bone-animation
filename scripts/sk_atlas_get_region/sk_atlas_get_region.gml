__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc returns the region array
/// @param atlas
/// @param key
return ds_map_find_value(argument0[sk_data_atlas.subtextures],argument1);