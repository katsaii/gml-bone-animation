/// @desc converts direction into a vector and transforms it
/// @param bone
/// @param angle
var sk_dr = argument1;
var sk_pa = argument0[sk_bone_var_m00];
var sk_pb = argument0[sk_bone_var_m01];
var sk_pc = argument0[sk_bone_var_m10];
var sk_pd = argument0[sk_bone_var_m11];
var sk_a = dcos(sk_dr);
var sk_b = -dsin(sk_dr);
return -darctan2((sk_pb*sk_a)+(sk_pd*sk_b),(sk_pa*sk_a)+(sk_pc*sk_b));