/// @desc allows for IK to performed between two bones which don't share a parent-child relationship
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
/// @param parent
var sk_parent = argument0[SK_BONE.parent];
// set temporary parent
argument0[@ SK_BONE.parent] = argument5;
argument0[@ SK_BONE.badApplied] = true; // this induces a change in the child's applied transform relative to the new parent
// update bone with new transforms
sk_ik_apply_chain(argument0,argument1,argument2,argument3,argument4);
// revert parent
argument0[@ SK_BONE.parent] = sk_parent;
// set to bad applied since the parent changed
argument0[@ SK_BONE.badApplied] = true;