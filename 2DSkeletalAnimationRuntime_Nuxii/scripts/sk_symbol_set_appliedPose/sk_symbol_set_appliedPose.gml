/// @desc set the final pose of the symbol
/// @param symbol
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param xshear
/// @param yshear
/// @param rotation
/// @param colour
/// @param alpha
/// @param bone
/// @param attachment
argument0[@ SK_SYMBOL.boneFinal] = argument10;
sk_bone_set_appliedPose(argument0[SK_SYMBOL.NESTED_BONE],argument1,argument2,argument3,argument4,argument5,argument6,argument7);
sk_slot_set_finalPose(argument0[SK_SYMBOL.NESTED_SLOT],argument8,argument9,noone,argument11);