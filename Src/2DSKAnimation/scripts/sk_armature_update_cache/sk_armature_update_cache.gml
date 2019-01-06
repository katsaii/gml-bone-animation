__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc Caches information about bones, slots, and constraints.
///		| THIS MUST BE CALLED IN THE FOLLOWING CASES:
///		| * Changes to the bone hierarchy (changing a parent, this may not apply to slots, but be aware and call this just incase)
///		| * Changes to the default draw order (deleting or adding a slot)
///		| * Changes to a constraint data sets, such as changing the end effector of an IKConstraint
///		| * New bones, slots, or constraints are created or removed from the armature
/// @param armature
var sk_updateOrder = argument0[sk_data_armature.updateOrder];
ds_list_clear(sk_updateOrder);
// sort constraints
var sk_constraints = argument0[sk_data_armature.constraints];
var sk_constraint_count = ds_list_size(sk_constraints);
for(var sk_constraint_id = 0; sk_constraint_id<sk_constraint_count; sk_constraint_id++){
	sk_updatable_cache(sk_constraints[| sk_constraint_id],sk_updateOrder);
}
// sort remaining bones
var sk_bones = argument0[sk_data_armature.bones];
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
	sk_updatable_cache(sk_bones[| sk_bone_id],sk_updateOrder);
}