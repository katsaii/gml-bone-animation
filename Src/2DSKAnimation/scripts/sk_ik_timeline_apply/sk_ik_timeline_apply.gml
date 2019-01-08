__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
var sk_target = argument0[sk_data_ik_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_IK_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_ik_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_EASE]);
var sk_bendDir = sk_keyframes[| ((argument3>=1) ? sk_keyframeB_id : sk_keyframeA_id)+SK_IK_KEYFRAME_BEND];
var sk_weight = lerp(
	sk_keyframes[| sk_keyframeA_id+SK_IK_KEYFRAME_WEIGHT],
	sk_keyframes[| sk_keyframeB_id+SK_IK_KEYFRAME_WEIGHT],
	sk_interpolation
);
// apply
switch(argument4){
	case SK_MIX_BLEND: case SK_MIX_ADD:
		if(argument5>0.5) then sk_target[@ sk_data_ik_constraint.appliedBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.appliedWeight] = lerp(sk_target[sk_data_ik_constraint.appliedWeight],sk_weight,argument5);
	break;
	case SK_MIX_OVERWRITE:
		if(argument5>0.5) then sk_target[@ sk_data_ik_constraint.setupBendDir] = sk_bendDir;
		sk_target[@ sk_data_ik_constraint.setupWeight] = lerp(sk_target[sk_data_ik_constraint.setupWeight],sk_weight,argument5);
	break;
}