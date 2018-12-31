/// @desc sets a property
/// @param bone
/// @param parent
argument0[@ sk_bone_var_parent] = (sk_object_exists(argument1)&&(sk_object_type(argument1)==sk_type_bone)) ? argument1 : undefined;