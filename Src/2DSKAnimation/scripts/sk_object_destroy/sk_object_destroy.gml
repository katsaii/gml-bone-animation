/// @desc destroys an object
/// @param variable
script_execute(__sk_script_get_index("__sk_"+string(sk_object_type(argument0))+"_dispose"),argument0);
var sk_id = ds_list_find_index(global.sk_object_activeObjects,argument0);
ds_list_delete(global.sk_object_activeObjects,sk_id);
ds_list_delete(global.sk_object_objectData,sk_id);