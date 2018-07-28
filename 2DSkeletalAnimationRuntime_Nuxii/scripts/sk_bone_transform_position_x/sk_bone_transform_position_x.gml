/// @desc takes a 2d vector and transforms it
/// @param bone
/// @param x
/// @param y
var sk_dx = argument1;
var sk_dy = argument2;
var sk_pa = argument0[SK_BONE.m00];
var sk_pc = argument0[SK_BONE.m10];
return argument1[SK_BONE.XWorld]+sk_pa*sk_dx+sk_pc*sk_dy;