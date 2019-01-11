__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframe_previous
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
/// @param events
var sk_target = argument0[sk_data_ik_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframePrevious_id = argument1*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframeA_id = argument2*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument3*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_ik_timeline.keyframes];
var sk_amount = argument4;
var sk_mixPose = argument5;
var sk_alpha = argument6;
var sk_events = argument7;
// interpolate
var sk_interpolation = sk_ease(sk_amount,sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_EASE]);
var sk_bendDir = sk_keyframes[| ((sk_amount>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_IK_KEYFRAME_BEND];
var sk_weight = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_WEIGHT],
	sk_keyframes[| sk_keyframeB_id+SK_IK_KEYFRAME_WEIGHT],
	sk_interpolation
);
// apply
switch(sk_mixPose){
	case SK_MIX_BLEND: case SK_MIX_ADD:
		if(sk_alpha>0.5) then sk_target[@ sk_data_ik_constraint.appliedBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.appliedWeight] = lerp(sk_target[sk_data_ik_constraint.appliedWeight],sk_weight,sk_alpha);
	break;
	case SK_MIX_OVERWRITE:
		if(sk_alpha>0.5) then sk_target[@ sk_data_ik_constraint.setupBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.setupWeight] = lerp(sk_target[sk_data_ik_constraint.setupWeight],sk_weight,sk_alpha);
	break;
}