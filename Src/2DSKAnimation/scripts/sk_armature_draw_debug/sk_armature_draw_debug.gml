__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc renders an abstract structure representing the bone
/// @param armature
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_bones = argument0[sk_data_armature.bones];
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	var sk_bone = sk_bones[| sk_bone_id];
	sk_bone_draw_debug(sk_bone,argument1,argument2,argument3,argument4,argument5,argument6);
}