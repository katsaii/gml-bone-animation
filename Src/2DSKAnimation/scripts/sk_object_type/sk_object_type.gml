/// @desc returns the type of object
/// @param variable
var sk_tuple = global.sk_object_objectData[| ds_list_find_index(global.sk_object_activeObjects,argument0)];
return sk_tuple[0];