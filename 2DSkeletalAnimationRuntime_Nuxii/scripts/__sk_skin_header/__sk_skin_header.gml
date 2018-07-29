#macro sk_type_skin __sk_skin_header
enum SK_SKIN{
	displays,
	remaps,
	remapStack,
	sizeof
}
#macro sk_tuple_skinRecord_slot 0 /* this could be a slot, but it could also be a symbol */
#macro sk_tuple_skinRecord_attachment 1
#macro sk_tuple_skinRecord_attachmentKey 2
#macro sk_tuple_skinRecord_ENTRIES 3
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_SKIN.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_SKIN.displays] = ds_list_create(); // create structures for storing skin data
			sk_structure[@ SK_SKIN.remaps] = ds_map_create();
			sk_structure[@ SK_SKIN.remapStack] = ds_list_create();
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_list_destroy(sk_structure[SK_SKIN.displays]); // destroy dynamic structures
			ds_map_destroy(sk_structure[SK_SKIN.remaps]);
			ds_list_destroy(sk_structure[SK_SKIN.remapStack]);
		}
	break;
}
return 0;