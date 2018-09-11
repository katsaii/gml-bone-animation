#macro sk_type_attachment_plane "__sk_attachment_header_plane"
enum SK_ATTACHMENT_PLANE{
	regionName,
	X,Y,m00,m01,m10,m11,
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
		return SK_ATTACHMENT_PLANE.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_attachment_plane_set_regionName(sk_structure,undefined);
			sk_attachment_plane_set_matrix(sk_structure,0,0,1,1,0,0,0);
		}
	break;
}
return 0;