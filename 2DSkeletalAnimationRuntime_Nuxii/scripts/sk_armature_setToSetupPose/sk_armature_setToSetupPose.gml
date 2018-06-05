/// @desc sets the local transforms of the bones, slots, and constraints
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrderDefault];
var sk_drawOrder = argument0[SK_ARMATURE.drawOrderDefault];
ds_list_copy(argument0[SK_ARMATURE.updateOrder],sk_updateOrder);
ds_list_copy(argument0[SK_ARMATURE.drawOrder],sk_drawOrder);
sk_cache_setToSetupPose(sk_updateOrder);
sk_cache_setToSetupPose(sk_drawOrder);