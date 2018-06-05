/// @desc constructor
/// @param struct
var sk_nestedBone = sk_bone_create("bone");
var sk_nestedSlot = sk_slot_create("slot");
argument0[@ SK_SYMBOL.NESTED_BONE] = sk_nestedBone;
argument0[@ SK_SYMBOL.NESTED_SLOT] = sk_nestedSlot;
sk_slot_set_setupPose(sk_nestedSlot,$ffffff,1,noone,noone); // set slot to be a parent of the nested bone
sk_slot_set_defaultDisplay(sk_nestedSlot,undefined);