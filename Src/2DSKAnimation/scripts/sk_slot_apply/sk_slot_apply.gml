/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
var sk_finalState = argument0[sk_slot_var_finalPose];
var sk_colour = sk_finalState[0];
var sk_alpha = sk_finalState[1];
var sk_bone = sk_finalState[2];
var sk_attachment = sk_finalState[3];
if((sk_bone!=undefined)&&(sk_attachment!=undefined)){
	sk_attachment_vertex_apply(sk_attachment,argument1,sk_bone,sk_colour,sk_alpha);
}