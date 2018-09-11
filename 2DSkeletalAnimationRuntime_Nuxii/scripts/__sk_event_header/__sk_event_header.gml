#macro sk_type_event "__sk_event_header"
enum SK_EVENT{
	callingScript,
	dBone,dString,dReal,dInt,dSound,
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
		return SK_EVENT.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_event_set_script(sk_structure,-1);
			sk_event_data_set(sk_structure,noone,"",0,0,-1);
		}
	break;
}
return 0;