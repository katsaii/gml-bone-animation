/// @desc removes header data from the structure array
/// @param struct
if(sk_struct_protected(argument0)){
	// cannot destroy a protected structure
	return false;
}
argument0[@ 1,SK_STRUCT_H.parity] = false;
argument0[@ 1,SK_STRUCT_H.type] = undefined;
sk_struct_set_name(argument0,"");
sk_struct_set_setup_script(argument0,-1);
sk_struct_set_apply_script(argument0,-1);
sk_struct_set_destroy_script(argument0,-1);
return true;