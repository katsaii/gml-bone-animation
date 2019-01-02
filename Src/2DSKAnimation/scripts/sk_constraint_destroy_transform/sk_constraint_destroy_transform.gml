#macro sk_constraint_destroy_transform sk_updatable_destroy
/// @desc clears bone data
/// @param constraint
ds_list_destroy(argument0[sk_constraint_transform_var_children]);