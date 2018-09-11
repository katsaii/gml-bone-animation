#macro sk_type_constraint_transform "__sk_constraint_header_transform"
enum SK_CONSTRAINT_TRANSFORM{
	local,relative,boneChildren,boneTarget,
	X,Y,XScale,YScale,YShear,rotation,
	translateMix,scaleMix,shearMix,rotateMix,
	translateMixFinal,scaleMixFinal,shearMixFinal,rotateMixFinal,
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
		return SK_CONSTRAINT_TRANSFORM.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_CONSTRAINT_TRANSFORM.boneChildren] = ds_list_create(); // create list for storing children
			sk_constraint_transform_set_local(sk_structure,false);
			sk_constraint_transform_set_relative(sk_structure,false);
			sk_constraint_transform_set_bone_target(sk_structure,noone);
			sk_constraint_transform_set_offset(sk_structure,0,0,1,1,0,0);
			sk_constraint_transform_set_mix(sk_structure,1,1,1,1);
			sk_constraint_transform_setToSetupMix(sk_structure);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_list_destroy(sk_structure[SK_CONSTRAINT_TRANSFORM.boneChildren]);
		}
	break;
}
return 0;