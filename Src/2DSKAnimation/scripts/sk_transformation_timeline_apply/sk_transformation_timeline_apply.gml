__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_timeline_exists(argument0);
/// @desc apply the timeline between two keyframes
/// @param timeline
/// @param keyframeA
/// @param keyframeB
/// @param amount
/// @param mixPose
/// @param alpha
var sk_target = argument0[sk_data_transformation_timeline.target];
if(sk_target==undefined) then return;
var sk_keyframeA_id = argument1*SK_TRANSFORMATION_KEYFRAME_ENTRIES;
var sk_keyframeB_id = argument2*SK_TRANSFORMATION_KEYFRAME_ENTRIES;
var sk_keyframes = argument0[sk_data_transformation_timeline.keyframes];
// interpolate
var sk_interpolation = sk_ease(argument3,sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_EASE]);
var sk_translate = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_TRANSLATE],sk_interpolation);
var sk_scale = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_SCALE],sk_interpolation);
var sk_shear = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_SHEAR],sk_interpolation);
var sk_rotate = lerp(sk_keyframes[| sk_keyframeA_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE],sk_keyframes[| sk_keyframeB_id+SK_TRANSFORMATION_KEYFRAME_MIX_ROTATE],sk_interpolation);
// apply
switch(argument4){
	case SK_MIX_BLEND: case SK_MIX_ADD:
		sk_target[@ sk_data_transformation_constraint.appliedMixTranslate] = lerp(sk_target[sk_data_transformation_constraint.appliedMixTranslate],sk_translate,argument5);
		sk_target[@ sk_data_transformation_constraint.appliedMixScale] = lerp(sk_target[sk_data_transformation_constraint.appliedMixScale],sk_scale,argument5);
		sk_target[@ sk_data_transformation_constraint.appliedMixShear] = lerp(sk_target[sk_data_transformation_constraint.appliedMixShear],sk_shear,argument5);
		sk_target[@ sk_data_transformation_constraint.appliedMixRotate] = lerp(sk_target[sk_data_transformation_constraint.appliedMixRotate],sk_rotate,argument5);
	break;
	case SK_MIX_OVERWRITE:
		sk_target[@ sk_data_transformation_constraint.setupMixTranslate] = lerp(sk_target[sk_data_transformation_constraint.setupMixTranslate],sk_translate,argument5);
		sk_target[@ sk_data_transformation_constraint.setupMixScale] = lerp(sk_target[sk_data_transformation_constraint.setupMixScale],sk_scale,argument5);
		sk_target[@ sk_data_transformation_constraint.setupMixShear] = lerp(sk_target[sk_data_transformation_constraint.setupMixShear],sk_shear,argument5);
		sk_target[@ sk_data_transformation_constraint.setupMixRotate] = lerp(sk_target[sk_data_transformation_constraint.setupMixRotate],sk_rotate,argument5);
	break;
}