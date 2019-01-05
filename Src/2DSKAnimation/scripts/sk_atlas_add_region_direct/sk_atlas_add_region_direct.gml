SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param u3
/// @param v3
/// @param u4
/// @param v4
/// @param ox
/// @param oy
/// @param w
/// @param h
var sk_region = [];
sk_region[@ 0] = clamp(argument2,0,1); // defined in a clockwise motion
sk_region[@ 1] = clamp(argument3,0,1);
sk_region[@ 2] = clamp(argument4,0,1);
sk_region[@ 3] = clamp(argument5,0,1);
sk_region[@ 4] = clamp(argument6,0,1);
sk_region[@ 5] = clamp(argument7,0,1);
sk_region[@ 6] = clamp(argument8,0,1);
sk_region[@ 7] = clamp(argument9,0,1);
sk_region[@ 8] = argument10; // this is relative to the top left of the region in world coordinates
sk_region[@ 9] = argument11;
sk_region[@ 10] = argument12;
sk_region[@ 11] = argument13;
ds_map_add(argument0[sk_atlas.subtextures],argument1,sk_region);