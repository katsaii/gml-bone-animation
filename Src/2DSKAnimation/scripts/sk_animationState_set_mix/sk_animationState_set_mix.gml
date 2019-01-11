__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc sets a property
/// @param state
/// @param anim_from
/// @param anim_to
/// @param amount
ds_map_add(argument0[sk_data_animationState.mixTable],string(argument1)+"->"+string(argument2),real(argument3));