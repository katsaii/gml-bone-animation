#macro sk_type_event __sk_event_header
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
			sk_event_script(sk_structure,sk_ev_default);
			sk_event_data_bone(sk_structure,noone);
			sk_event_data_string(sk_structure,"");
			sk_event_data_real(sk_structure,0);
			sk_event_data_int(sk_structure,0);
			sk_event_data_sound(sk_structure,-1);
		}
	break;
}
return 0;