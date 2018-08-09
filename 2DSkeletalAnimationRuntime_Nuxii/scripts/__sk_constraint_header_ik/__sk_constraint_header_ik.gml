#macro sk_type_constraint_ik "__sk_constraint_header_ik"
enum SK_CONSTRAINT_IK{
	chain,boneJoint,boneEffector,
	bendDir,weight,
	bendDirFinal,weightFinal,
	sizeof
}
#macro sk_bendDir_positive 1
#macro sk_bendDir_negative -1
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_CONSTRAINT_IK.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_constraint_ik_bendDir(sk_structure,sk_bendDir_negative);
			sk_constraint_ik_weight(sk_structure,1);
			sk_constraint_ik_chain(sk_structure,false);
			sk_constraint_ik_bone_joint(sk_structure,noone);
			sk_constraint_ik_bone_effector(sk_structure,noone);
			sk_constraint_ik_setToSetupMix(sk_structure);
		}
	break;
}
return 0;