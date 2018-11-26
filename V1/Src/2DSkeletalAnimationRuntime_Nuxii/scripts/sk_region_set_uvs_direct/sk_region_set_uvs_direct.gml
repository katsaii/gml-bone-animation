/// @desc sets the UV data for the region (this may result is affine distortion if opposite edges are not parallel)
/// @param region
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
argument0[@ SK_REGION.uv_ULX] = clamp(argument1,0,1); // defined in a clockwise motion
argument0[@ SK_REGION.uv_ULY] = clamp(argument2,0,1);
argument0[@ SK_REGION.uv_URX] = clamp(argument3,0,1);
argument0[@ SK_REGION.uv_URY] = clamp(argument4,0,1);
argument0[@ SK_REGION.uv_BRX] = clamp(argument5,0,1);
argument0[@ SK_REGION.uv_BRY] = clamp(argument6,0,1);
argument0[@ SK_REGION.uv_BLX] = clamp(argument7,0,1);
argument0[@ SK_REGION.uv_BLY] = clamp(argument8,0,1);
argument0[@ SK_REGION.ox] = argument9; // this is relative to the top left of the region in world coordinates
argument0[@ SK_REGION.oy] = argument10;
argument0[@ SK_REGION.width] = argument11;
argument0[@ SK_REGION.height] = argument12;