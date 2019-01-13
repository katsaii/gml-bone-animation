__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sets a property
/// @param constraint
/// @param id
var sk_system = argument0[sk_data_physics_constraint.system];
ds_list_clear(sk_system);
var sk_bone_count = ds_list_size(argument1);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	var sk_bone = argument1[| sk_bone_id];
	if(sk_bone_exists(sk_bone)){
		ds_list_add(sk_system,sk_bone);
	}
}