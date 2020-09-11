gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_renderable_vformat = vertex_format_end();
");
/// @desc variant of vertex begin which automatically fills the format
/// @param vbuff
vertex_begin(argument0,global.sk_renderable_vformat);