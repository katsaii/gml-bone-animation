__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_drawOrder_timeline_exists(argument0);
if(false) then var sk_ignoreTheseArguments = [argument4,argument6,argument7];
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
/// @param mixDirection
var sk_target = argument0[sk_data_drawOrder_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_DRAW_ORDER_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_DRAW_ORDER_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_drawOrder_timeline.keyframes];
if(argument5>=0.5){
	// interpolate
	var sk_tuple = sk_keyframes[| ((argument3>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_DRAW_ORDER_KEYFRAME_TUPLE];
	if(sk_tuple==undefined) then return;
	// apply
	__sk_shift_value_list(sk_target,sk_tuple);
}