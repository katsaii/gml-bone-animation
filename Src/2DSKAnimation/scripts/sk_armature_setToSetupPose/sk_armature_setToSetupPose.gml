/// @desc sets the local transforms of the bones, slots, and constraints
/// @param armature
var sk_updateOrder = argument0[sk_armature_var_updateOrder];
var sk_drawOrder = argument0[sk_armature_var_drawOrderFinal];
ds_list_copy(sk_drawOrder,argument0[sk_armature_var_drawOrder]);
// set bones/constraints to setup pose
var sk_updatable_count = ds_list_size(sk_updateOrder);
for(var sk_updatable_id = 0; sk_updatable_id<sk_updatable_count; sk_updatable_id++){
	sk_updatable_setup(sk_updateOrder[| sk_updatable_id]);
}
// set slots to setup pose
var sk_slot_count = ds_list_size(sk_drawOrder);
for(var sk_slot_count = 0; sk_slot_count<sk_slot_count; sk_slot_count++){
	sk_slot_setToSetupPose(sk_drawOrder[| sk_slot_count]);
}