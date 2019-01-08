__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_atlas_exists(argument0);
/// @desc adds a subtexture to the subtexture map
/// @param atlas
/// @param key
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param ox
/// @param oy
/// @param w
/// @param h
/// @param rotation
var sk_uv_left = clamp(argument2,0,1);
var sk_uv_top = clamp(argument3,0,1);
var sk_uv_right = clamp(argument4,0,1);
var sk_uv_bottom = clamp(argument5,0,1);
var sk_uv_ox = argument6;
var sk_uv_oy = argument7;
var sk_uv_width = argument8;
var sk_uv_height = argument9;
var sk_region = array_create(12);
switch(floor((angle_difference(argument10+45,0))/90)){
	case -2:
		// rotate 180 degrees
		sk_region[@ 0] = sk_uv_right;
		sk_region[@ 1] = sk_uv_bottom;
		sk_region[@ 2] = sk_uv_left;
		sk_region[@ 3] = sk_uv_bottom;
		sk_region[@ 4] = sk_uv_right;
		sk_region[@ 5] = sk_uv_top;
		sk_region[@ 6] = sk_uv_left;
		sk_region[@ 7] = sk_uv_top;
	break;
	case -1:
		// rotate 90 degrees clockwise
		sk_region[@ 0] = sk_uv_right;
		sk_region[@ 1] = sk_uv_top;
		sk_region[@ 2] = sk_uv_right;
		sk_region[@ 3] = sk_uv_bottom;
		sk_region[@ 4] = sk_uv_left;
		sk_region[@ 5] = sk_uv_top;
		sk_region[@ 6] = sk_uv_left;
		sk_region[@ 7] = sk_uv_bottom;
	break;
	case 0:
		// no rotation
		sk_region[@ 0] = sk_uv_left;
		sk_region[@ 1] = sk_uv_top;
		sk_region[@ 2] = sk_uv_right;
		sk_region[@ 3] = sk_uv_top;
		sk_region[@ 4] = sk_uv_left;
		sk_region[@ 5] = sk_uv_bottom;
		sk_region[@ 6] = sk_uv_right;
		sk_region[@ 7] = sk_uv_bottom;
	break;
	case 1:
		// rotate 90 degrees counter clockwise
		sk_region[@ 0] = sk_uv_left;
		sk_region[@ 1] = sk_uv_bottom;
		sk_region[@ 2] = sk_uv_left;
		sk_region[@ 3] = sk_uv_top;
		sk_region[@ 4] = sk_uv_right;
		sk_region[@ 5] = sk_uv_bottom;
		sk_region[@ 6] = sk_uv_right;
		sk_region[@ 7] = sk_uv_top;
	break;
}
sk_region[@ 8] = sk_uv_ox;
sk_region[@ 9] = sk_uv_oy;
sk_region[@ 10] = sk_uv_width;
sk_region[@ 11] = sk_uv_height;
ds_map_add(argument0[sk_data_atlas.subtextures],argument1,sk_region);