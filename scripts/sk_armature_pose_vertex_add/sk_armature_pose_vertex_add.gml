__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_armature_exists(argument0);
/// @desc iterates through the slots and applies them to the vertex buffer
/// @param armature
/// @param vbuff
var sk_drawOrder = argument0[sk_data_armature.drawOrder];
var sk_slot_id_last = ds_list_size(sk_drawOrder)-1;
for(var sk_slot_id = 0; sk_slot_id<=sk_slot_id_last; sk_slot_id++){
	sk_renderable_vertex_add(sk_drawOrder[| sk_slot_id],argument1);
}