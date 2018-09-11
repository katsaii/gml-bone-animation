#macro sk_type_constraint_hierarchy "__sk_constraint_header_hierarchy"
enum SK_CONSTRAINT_HIERARCHY{
	boneParentTuples, /* a list of 2 record tuple consisting of a bone and the id of its parent */
	displayKey,
	displayKeyFinal,
	sizeof
}
#macro sk_tuple_boneParent_bone 0
#macro sk_tuple_boneParent_parent 1
#macro sk_tuple_boneParent_ENTRIES 2
/// @desc specialises a structure
/// @param command
/// @param struct
var sk_cmd = argument0;
var sk_structure = argument1;
switch(sk_cmd){
	// Select command
	case sk_structure_type_command.get_sizeof:
		return SK_CONSTRAINT_HIERARCHY.sizeof;
	break;
	case sk_structure_type_command.me_construct:
		if(sk_struct_exists(sk_structure)){
			sk_structure[@ SK_CONSTRAINT_HIERARCHY.boneParentTuples] = ds_map_create(); // create a list for storing hierarchy states
			sk_constraint_hierarchy_set_displayKey(sk_structure,undefined);
			sk_constraint_hierarchy_setToSetupMix(sk_structure);
		}
	break;
	case sk_structure_type_command.me_destruct:
		if(sk_struct_exists(sk_structure)){
			ds_map_destroy(sk_structure[SK_CONSTRAINT_HIERARCHY.boneParentTuples]);
		}
	break;
}
return 0;