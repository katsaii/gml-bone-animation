/// @desc iterates through the updatables and updates their world transforms
/// @param armature
var sk_updateOrder = argument0[sk_armature_var_updateOrder];
var sk_updatable_count = ds_list_size(sk_updateOrder);
for(var sk_updatable_id = 0; sk_updatable_id<sk_updatable_count; sk_updatable_id++){
	sk_updatable_update(sk_updateOrder[| sk_updatable_id]);
}