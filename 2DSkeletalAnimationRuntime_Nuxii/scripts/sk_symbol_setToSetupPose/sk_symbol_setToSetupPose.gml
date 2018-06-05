gml_pragma("forceinline");
/// @desc sets the local transforms of the supplied symbol
/// @param symbol
sk_bone_setToSetupPose(argument0[SK_SYMBOL.NESTED_BONE]);
sk_slot_setToSetupPose(argument0[SK_SYMBOL.NESTED_SLOT]);
argument0[@ SK_SYMBOL.boneFinal] = argument0[SK_SYMBOL.bone];