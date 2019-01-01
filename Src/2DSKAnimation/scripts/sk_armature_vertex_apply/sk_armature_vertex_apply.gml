/// @desc iterates through the slots and applies them to the vertex buffer
/// @param armature
/// @param vbuff
var sk_drawOrder = argument0[sk_armature_var_drawOrderFinal];
var sk_slot_id_last = ds_list_size(sk_drawOrder)-1;
for(var sk_slot_id = 0; sk_slot_id<=sk_slot_id_last; sk_slot_id++){
	sk_symbol_vertex_apply(sk_drawOrder[| sk_slot_id],argument1,sk_slot_id==0,sk_slot_id==sk_slot_id_last);
}