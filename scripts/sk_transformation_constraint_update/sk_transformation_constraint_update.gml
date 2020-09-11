__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc applys transformations between a set of bones and a universal parent bone
/// @param constraint
var sk_boneTarget = argument0[sk_data_transformation_constraint.target];
if(sk_boneTarget==undefined) then return;
var sk_bones = argument0[sk_data_transformation_constraint.children];
var sk_xoffset = argument0[sk_data_transformation_constraint.offsetX];
var sk_yoffset = argument0[sk_data_transformation_constraint.offsetY];
var sk_xscaleoffset = argument0[sk_data_transformation_constraint.offsetXScale];
var sk_yscaleoffset = argument0[sk_data_transformation_constraint.offsetYScale];
var sk_yshearoffset = argument0[sk_data_transformation_constraint.offsetShear];
var sk_rotationoffset = argument0[sk_data_transformation_constraint.offsetRotation];
var sk_translateMix = argument0[sk_data_transformation_constraint.appliedMixTranslate];
var sk_scaleMix = argument0[sk_data_transformation_constraint.appliedMixScale];
var sk_shearMix = argument0[sk_data_transformation_constraint.appliedMixShear];
var sk_rotateMix = argument0[sk_data_transformation_constraint.appliedMixRotate];
var sk_bone_count = ds_list_size(sk_bones);
switch(argument0[sk_data_transformation_constraint.state]){
	case (0<<0)|(0<<1): // not local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_absolute_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (1<<0)|(0<<1): // local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_absolute_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (0<<0)|(1<<1): // not local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_relative_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case (1<<0)|(1<<1): // local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_bone_count; sk_bone_id++){
			sk_bone_interpolate_relative_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
}