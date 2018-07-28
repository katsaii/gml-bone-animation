/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
var sk_dx = argument1;
var sk_dy = argument2;
var sk_pb = argument0[SK_BONE.m01];
var sk_pd = argument0[SK_BONE.m11];
return argument0[SK_BONE.YWorld]+sk_pb*sk_dx+sk_pd*sk_dy;