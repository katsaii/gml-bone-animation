/// @desc sets the UV data for the region
/// @param region
/// @param u1
/// @param v1
/// @param u2
/// @param v2
/// @param ox
/// @param oy
/// @param w
/// @param h
/// @param rotation
var uv_left = clamp(argument1,0,1);
var uv_top = clamp(argument2,0,1);
var uv_right = clamp(argument3,0,1);
var uv_bottom = clamp(argument4,0,1);
var uv_ox = argument5;
var uv_oy = argument6;
var uv_width = argument7;
var uv_height = argument8;
switch(floor((angle_difference(argument9+45,0))/90)){
	case -2:
		// rotate 180 degrees
		argument0[@ SK_REGION.uv_ULX] = uv_right;
		argument0[@ SK_REGION.uv_ULY] = uv_bottom;
		argument0[@ SK_REGION.uv_URX] = uv_left;
		argument0[@ SK_REGION.uv_URY] = uv_bottom;
		argument0[@ SK_REGION.uv_BLX] = uv_right;
		argument0[@ SK_REGION.uv_BLY] = uv_top;
		argument0[@ SK_REGION.uv_BRX] = uv_left;
		argument0[@ SK_REGION.uv_BRY] = uv_top;
	break;
	case -1:
		// rotate 90 degrees clockwise
		argument0[@ SK_REGION.uv_ULX] = uv_right;
		argument0[@ SK_REGION.uv_ULY] = uv_top;
		argument0[@ SK_REGION.uv_URX] = uv_right;
		argument0[@ SK_REGION.uv_URY] = uv_bottom;
		argument0[@ SK_REGION.uv_BLX] = uv_left;
		argument0[@ SK_REGION.uv_BLY] = uv_top;
		argument0[@ SK_REGION.uv_BRX] = uv_left;
		argument0[@ SK_REGION.uv_BRY] = uv_bottom;
	break;
	case 0:
		// no rotation
		argument0[@ SK_REGION.uv_ULX] = uv_left;
		argument0[@ SK_REGION.uv_ULY] = uv_top;
		argument0[@ SK_REGION.uv_URX] = uv_right;
		argument0[@ SK_REGION.uv_URY] = uv_top;
		argument0[@ SK_REGION.uv_BLX] = uv_left;
		argument0[@ SK_REGION.uv_BLY] = uv_bottom;
		argument0[@ SK_REGION.uv_BRX] = uv_right;
		argument0[@ SK_REGION.uv_BRY] = uv_bottom;
	break;
	case 1:
		// rotate 90 degrees counter clockwise
		argument0[@ SK_REGION.uv_ULX] = uv_left;
		argument0[@ SK_REGION.uv_ULY] = uv_bottom;
		argument0[@ SK_REGION.uv_URX] = uv_left;
		argument0[@ SK_REGION.uv_URY] = uv_top;
		argument0[@ SK_REGION.uv_BLX] = uv_right;
		argument0[@ SK_REGION.uv_BLY] = uv_bottom;
		argument0[@ SK_REGION.uv_BRX] = uv_right;
		argument0[@ SK_REGION.uv_BRY] = uv_top;
	break;
}
argument0[@ SK_REGION.ox] = uv_ox;
argument0[@ SK_REGION.oy] = uv_oy;
argument0[@ SK_REGION.width] = uv_width;
argument0[@ SK_REGION.height] = uv_height;