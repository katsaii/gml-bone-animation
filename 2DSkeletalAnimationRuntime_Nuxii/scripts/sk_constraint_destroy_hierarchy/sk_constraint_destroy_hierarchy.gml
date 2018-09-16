/// @desc deletes the supplied structure and unhooks its array
/// @param constraint
array_unhook_sk_structure(argument0);
// destroy dynamic data structures
ds_map_destroy(argument0[SK_CONSTRAINT_HIERARCHY.boneParentTuples]);