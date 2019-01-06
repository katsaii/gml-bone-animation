gml_pragma("global",@'
	global.sk_object_activeObjects = ds_list_create();
	global.sk_object_objectData = ds_list_create();
');
/// @desc creates an object
/// @param type
/// @param [interface]
var sk_obj = [];
var sk_type = argument[0];
var sk_interface = (argument_count>1) ? argument[1] : undefined;
ds_list_add(global.sk_object_activeObjects,sk_obj);
ds_list_add(global.sk_object_objectData,[sk_type,sk_interface]);
script_execute(sk_type_script_get_index(sk_type,"init",true),sk_obj);
script_execute(sk_interface_script_get_index(sk_interface,"interface_implement"),sk_obj);
return sk_obj;