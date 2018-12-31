#macro sk_object_var_type 0+1,0
#macro sk_object_var_name 0+1,1
#macro sk_object_var_class 0+1,2
#macro sk_object_var_args 0+1,3
/// @desc creates an empty skeleton object
/// @param type
/// @param name
/// @param class
var sk_obj = [];
sk_obj[@ sk_object_var_type] = argument0;
sk_obj[@ sk_object_var_name] = string(argument1);
sk_obj[@ sk_object_var_class] = argument2;
return sk_obj;