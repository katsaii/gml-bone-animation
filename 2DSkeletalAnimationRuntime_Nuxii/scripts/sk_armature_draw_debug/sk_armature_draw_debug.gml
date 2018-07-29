/// @desc renders an abstract structure representing the skeleton data
/// @param armature
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rotation
/// @param debugArgs
var sk_updateOrder = argument0[SK_ARMATURE.updateOrder];
var sk_record_count = ds_list_size(sk_updateOrder); 
for(var sk_record_id = 0; sk_record_id < sk_record_count; sk_record_id++){
	var sk_record = sk_updateOrder[| sk_record_id];
	if(sk_struct_exists(sk_record,sk_type_bone)){
		sk_bone_draw_debug(sk_record,argument1,argument2,argument3,argument4,argument5,argument6);
	}
}