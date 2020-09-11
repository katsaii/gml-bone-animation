/// @desc destroys an object
/// @param variable
script_execute(sk_type_script_get_index(sk_object_type(argument0),"dispose",true),argument0);
var sk_id = ds_list_find_index(global.sk_object_activeObjects,argument0);
ds_list_delete(global.sk_object_activeObjects,sk_id);
ds_list_delete(global.sk_object_objectData,sk_id);