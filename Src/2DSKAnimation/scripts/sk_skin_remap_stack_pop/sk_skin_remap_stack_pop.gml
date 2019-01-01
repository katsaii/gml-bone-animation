/// @desc pops the remap from the skins stack
/// @param skin
/// @param key
var sk_skin_remapStack = argument0[sk_skin_var_remapStack];
var sk_remap_id = ds_list_find_index(sk_skin_remapStack,argument1);
if(sk_remap_id!=-1){
	ds_list_delete(sk_skin_remapStack,sk_remap_id);
}