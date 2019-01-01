gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_slot_vformat = vertex_format_end();
");
/// @desc applies the slot to the vertex buffer
/// @param slot
/// @param vbuff
/// @param begin
/// @param end
if(argument2) then vertex_begin(argument1,global.sk_slot_vformat);
script_execute(argument0[sk_symbol_var_apply],argument0,argument1);
if(argument3) then vertex_end(argument1);