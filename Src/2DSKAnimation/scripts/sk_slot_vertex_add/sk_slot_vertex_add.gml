/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
var sk_bone = argument0[sk_data_slot.appliedBone];
var sk_attachment = argument0[sk_data_slot.appliedAttachment];
if((sk_bone!=undefined)&&(sk_attachment!=undefined)){
	sk_attachment_vertex_add(sk_attachment,argument1,sk_bone,argument0[sk_data_slot.appliedColour],argument0[sk_data_slot.appliedAlpha]);
}