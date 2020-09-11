__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns a property
/// @param state
/// @param anim_from
/// @param anim_to
var sk_mix = ds_map_find_value(argument0[sk_data_animationState.mixTable],string(argument1)+"->"+string(argument2));
if(is_real(sk_mix)){
	return sk_mix;
}	return argument0[sk_data_animationState.defaultMixSpeed];