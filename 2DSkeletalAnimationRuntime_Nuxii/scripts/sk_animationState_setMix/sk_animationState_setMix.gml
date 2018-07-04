/// @desc sets the mix speed between two animations
/// @param animationState
/// @param animfrom
/// @param animto
/// @param speed
ds_map_add(
	argument0[SK_ANIMATIONSTATE.mixTable],
	sk_createCompoundKey(
		// create a compound key for fast look-up of mix speeds
		argument1,
		argument2
	),
	argument3
);