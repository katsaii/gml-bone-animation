#macro sk_type_attachment_point "__sk_attachment_header_point"
enum SK_ATTACHMENT_POINT{
	X,Y,rotation,
	sizeof
}
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_ATTACHMENT_POINT.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_attachment_point_set_offsets(sk_structure,0,0,0);
		}
	break;
}
return 0;