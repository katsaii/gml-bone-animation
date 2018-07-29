#macro sk_type_constraint_physics __sk_constraint_header_physics
enum SK_CONSTRAINT_PHYSICS{
	rigid, /* if the bob is a distance less than the bone length, the bone will be scaled so its tip is exactly at the bob */
	boneSystem,boneAnchor,boneEffector, /* anchor is the bone the system will be attached to, the effector is where the bones will try to reach to */
	XGrav,YGrav,drive,
	XGravFinal,YGravFinal,driveFinal,
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
		return SK_CONSTRAINT_PHYSICS.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_CONSTRAINT_PHYSICS.boneSystem] = ds_list_create(); // create a list for storing system data (similar to transformation constraints)
			sk_constraint_physics_rigid(sk_structure,false);
			sk_constraint_physics_bone_anchor(sk_structure,noone);
			sk_constraint_physics_bone_effector(sk_structure,noone);
			sk_constraint_physics_gravity_x(sk_structure,0);
			sk_constraint_physics_gravity_y(sk_structure,0);
			sk_constraint_physics_drive(sk_structure,1);
			sk_constraint_physics_setToSetupMix(sk_structure);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_list_destroy(sk_structure[SK_CONSTRAINT_PHYSICS.boneSystem]);
		}
	break;
}
return 0;