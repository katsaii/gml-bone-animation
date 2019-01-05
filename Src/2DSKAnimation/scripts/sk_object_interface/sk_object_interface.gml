/// @desc returns the interface of the object
/// @param variable
var sk_tuple = global.sk_object_objectData[| ds_list_find_index(global.sk_object_activeObjects,argument0)];
return sk_tuple[1];