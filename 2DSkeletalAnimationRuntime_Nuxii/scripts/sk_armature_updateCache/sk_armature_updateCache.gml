/// @desc Caches information about bones, slots, and constraints.
///		| THIS MUST BE CALLED IN THE FOLLOWING CASES:
///		| * Changes to the bone hierarchy (changing a parent, this may not apply to slots, but be aware and call this just incase)
///		| * Changes to the default draw order (deleting or adding a slot)
///		| * Changes to a constraint data sets, such as changing the end effector of an IKConstraint
///		| * New bones, slots, or constraints are created or removed from the armature
/// @param armature
var sk_updateOrder = argument0[SK_ARMATURE.updateOrderDefault];
var sk_drawOrder = argument0[SK_ARMATURE.drawOrderDefault];
var sk_bones = argument0[SK_ARMATURE.bones];
var sk_slots = argument0[SK_ARMATURE.slots];
var sk_constraints = argument0[SK_ARMATURE.constraints];
// clear previous cache
ds_list_clear(sk_updateOrder);
ds_list_clear(sk_drawOrder);
// sort constraints
var sk_constraint_count = ds_list_size(sk_constraints);
for(var sk_constraint_id = 0; sk_constraint_id < sk_constraint_count; sk_constraint_id++){
	var sk_constraint = sk_constraints[| sk_constraint_id];
	if(SK_CONFIG_RELEASE_MODE||sk_struct_exists(sk_constraint)){
		switch(sk_struct_get_type(sk_constraint)){
			case sk_type_constraint_ik: sk_cache_sort_constraint_ik(sk_updateOrder,sk_constraint); break;
			case sk_type_constraint_transform: sk_cache_sort_constraint_transform(sk_updateOrder,sk_constraint); break;
			case sk_type_constraint_hierarchy: sk_cache_sort_constraint_hierarchy(sk_updateOrder,sk_constraint); break;
			case sk_type_constraint_physics: sk_cache_sort_constraint_physics(sk_updateOrder,sk_constraint); break;
		}
	}
}
// sort remaining bones
var sk_bone_count = ds_list_size(sk_bones);
for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
	sk_cache_sort_bone(sk_updateOrder,sk_bones[| sk_bone_id]);
}
// add all images to draw order
var sk_slot_count = ds_list_size(sk_slots);
for(var sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	ds_list_add(sk_drawOrder,sk_slots[| sk_slot_id]);
}