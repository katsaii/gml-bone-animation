/// @desc renders an abstract structure representing the bone
/// @param armature
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_updateOrder = argument0[sk_armature_var_updateOrder];
var sk_updatable_count = ds_list_size(sk_updateOrder);
for(var sk_updatable_id = 0; sk_updatable_id<sk_updatable_count; sk_updatable_id++){
	var sk_updatable = sk_updateOrder[| sk_updatable_id];
	if(sk_object_oftype(sk_updatable,sk_type_bone)){		
		sk_bone_draw_debug(sk_updatable,argument1,argument2,argument3,argument4,argument5,argument6);
	}
}