#macro sk_type_region "__sk_region_header"
enum SK_REGION{
	uv_ULX,uv_ULY,
	uv_URX,uv_URY,
	uv_BLX,uv_BLY,
	uv_BRX,uv_BRY,
	ox,oy,width,height,
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
		return SK_REGION.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_region_set_uvs(
				sk_structure,
				0,0,1,1,
				0,0,1,1,
				0
			);
		}
	break;
}
return 0;