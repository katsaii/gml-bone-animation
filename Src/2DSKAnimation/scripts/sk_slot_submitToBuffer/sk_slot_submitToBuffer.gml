/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
var sk_colour = argument0[sk_symbol_var_colour];
var sk_alpha = argument0[sk_symbol_var_alpha];
var sk_bone = argument0[sk_symbol_var_bone];
var sk_attachment = argument0[sk_symbol_var_attachment];
if((sk_bone!=undefined)&&(sk_attachment!=undefined)){
	sk_attachment_vertex_apply(sk_attachment,argument1,sk_bone,sk_colour,sk_alpha);
}