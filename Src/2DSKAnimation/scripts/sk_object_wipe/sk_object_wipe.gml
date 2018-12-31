#macro sk_object_var_type 0+2,0
#macro sk_object_var_name 0+2,1
#macro sk_object_var_class 0+2,2
#macro sk_object_var_args 0+2,3
/// @desc wipes the object data
/// @param object
var sk_nullPtr = [undefined];
argument0[@ sk_object_var_type] = sk_nullPtr;
argument0[@ sk_object_var_name] = sk_nullPtr;
argument0[@ sk_object_var_class] = sk_nullPtr;