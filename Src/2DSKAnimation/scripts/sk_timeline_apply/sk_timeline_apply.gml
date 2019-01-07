__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_timeline_exists(argument0);
gml_pragma("forceinline");
#macro SK_MIX_BLEND 0 /* interpolates between the current pose and next pose */
#macro SK_MIX_ADD 1 /* adds the next pose to the current pose */
#macro SK_MIX_OVERWRITE 2 /* permanently overwrites the setup pose with the supplied animation, this is useful for changing colours and transforms globally - THIS IS NOT A REVERTABLE ACTION */
/// @desc calls an internal script
/// @param variable
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
script_execute(argument0[1,0],argument0,argument1,argument2,argument3,argument4,argument5);