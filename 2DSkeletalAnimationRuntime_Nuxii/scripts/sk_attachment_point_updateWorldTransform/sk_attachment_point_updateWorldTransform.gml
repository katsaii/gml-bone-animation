gml_pragma("forceinline");
/// @desc uses a bones world transform to update the transform of the point attachment
/// @param attachment
/// @param bone
var sk_dx = argument0[SK_ATTACHMENT_POINT.X];
var sk_dy = argument0[SK_ATTACHMENT_POINT.Y];
var sk_dr = argument0[SK_ATTACHMENT_POINT.rotation];
var sk_pa = argument1[SK_BONE.m00];
var sk_pb = argument1[SK_BONE.m01];
var sk_pc = argument1[SK_BONE.m10];
var sk_pd = argument1[SK_BONE.m11];
var sk_a = dcos(sk_dr);
var sk_b = -dsin(sk_dr);
argument0[@ SK_ATTACHMENT_POINT.XWorld] = argument1[SK_BONE.XWorld]+sk_pa*sk_dx+sk_pc*sk_dy;
argument0[@ SK_ATTACHMENT_POINT.YWorld] = argument1[SK_BONE.YWorld]+sk_pb*sk_dx+sk_pd*sk_dy;
argument0[@ SK_ATTACHMENT_POINT.rotationWorld] = -darctan2((sk_pb*sk_a)+(sk_pd*sk_b),(sk_pa*sk_a)+(sk_pc*sk_b));