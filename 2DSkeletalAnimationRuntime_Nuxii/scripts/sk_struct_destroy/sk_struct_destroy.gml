/// @desc calls the destructor script on a supplied structure
/// @param struct
var sk_scr_id = sk_struct_get_destroy_script(argument0);
if(sk_scr_id!=-1){ // the function will always return -1 if the script doesnt exist
	// call script with structure as an argument
	script_execute(sk_scr_id,argument0);
}
// check whether the structure was destroyed successfully
if(sk_struct_exists(argument0)){
	// if the structure wasn't destroyed (the script doesn't exist) unhook the struct manually
	array_unhook_sk_structure(argument0);
}