__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc extracts region data from the supplied texture atlas
/// @param attachment
/// @param atlas
argument0[@ sk_data_plane_attachment.regionData] = sk_atlas_get_region_normalised(argument1,argument0[sk_data_plane_attachment.regionKey]);