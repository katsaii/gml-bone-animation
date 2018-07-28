/// @desc gets or sets a property
/// @param animationState
/// @param animfrom
/// @param animto
/// @param [speed]
var sk_struct = argument[0];
var sk_anim_mixTable = sk_struct[SK_ANIMATIONSTATE.mixTable];
var sk_anim_compoundKey = sk_createCompoundKey(
	// create a compound key for fast look-up of mix speeds
	argument[1],
	argument[2]
);
if(argument_count<4){
	// get
	var sk_mix = ds_map_find_value(sk_anim_mixTable,sk_anim_compoundKey);
	if(is_real(sk_mix)){
		return sk_mix;
	}	return sk_struct[SK_ANIMATIONSTATE.mixSpeedDefault];
}	// set
	ds_map_add(sk_anim_mixTable,sk_anim_compoundKey,real(argument[3]));
	return undefined;