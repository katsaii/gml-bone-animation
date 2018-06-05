/// @desc pushes the remap to the skins stack
/// @param skin
/// @param key
var sk_skin_remapStack = argument0[SK_SKIN.remapStack];
var sk_remap_id = ds_list_find_index(sk_skin_remapStack,argument1);
if(sk_remap_id!=-1){
	// item already exists, remove it so it can be added to the top
	ds_list_delete(sk_skin_remapStack,sk_remap_id);
}
// add item to top of stack
ds_list_add(sk_skin_remapStack,argument1);