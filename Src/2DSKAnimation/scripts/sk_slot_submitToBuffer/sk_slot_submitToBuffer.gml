/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
var sk_state = argument0[sk_symbol_var_worldState];
var sk_bone = sk_state[2];
var sk_attachment = sk_state[3];
if((sk_bone!=undefined)&&(sk_attachment!=undefined)){
	sk_attachment_vertex_apply(sk_attachment,argument1,sk_bone,sk_state[0],sk_state[1]);
}