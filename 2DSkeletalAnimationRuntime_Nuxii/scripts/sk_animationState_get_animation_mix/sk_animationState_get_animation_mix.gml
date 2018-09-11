gml_pragma("forceinline");
/// @desc gets a property
/// @param animationState
/// @param animfrom
/// @param animto
var sk_mix = ds_map_find_value(argument0[SK_ANIMATIONSTATE.mixTable],sk_createCompoundKey(argument1,argument2));
if(is_real(sk_mix)){
	return sk_mix;
}	return argument0[SK_ANIMATIONSTATE.mixSpeedDefault];