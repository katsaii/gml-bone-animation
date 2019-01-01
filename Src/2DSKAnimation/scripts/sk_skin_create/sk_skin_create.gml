#macro sk_type_skin sk_skin_create
#macro sk_skin_var_displays 0
#macro sk_skin_var_remaps 1
#macro sk_skin_var_remapStack 2
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build(sk_type_skin,argument0,undefined);
sk_obj[@ sk_skin_var_displays] = ds_list_create();
sk_obj[@ sk_skin_var_remaps] = ds_map_create();
sk_obj[@ sk_skin_var_remapStack] = ds_list_create();
return sk_obj;