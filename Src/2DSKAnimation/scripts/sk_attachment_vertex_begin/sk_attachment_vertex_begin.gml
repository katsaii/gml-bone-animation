gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_attachment_vformat = vertex_format_end();
");
/// @desc applies the attachment to the supplied vbuffer
/// @param attachment
/// @param vbuff
/// @param bone
/// @param colour
/// @param alpha
vertex_begin(argument1,global.sk_attachment_vformat);
sk_attachment_vertex_add(argument0,argument1,argument2,argument3,argument4);