/// @desc applys transformations between a set of bones and a universal parent bone
/// @param constraint
var sk_boneTarget = argument0[sk_constraint_transform_var_target];
var sk_bones = argument0[sk_constraint_transform_var_children];
var sk_boneCount = ds_list_size(sk_bones);
var sk_xoffset = argument0[sk_constraint_transform_var_x];
var sk_yoffset = argument0[sk_constraint_transform_var_y];
var sk_xscaleoffset = argument0[sk_constraint_transform_var_xscale];
var sk_yscaleoffset = argument0[sk_constraint_transform_var_yscale];
var sk_yshearoffset = argument0[sk_constraint_transform_var_yshear];
var sk_rotationoffset = argument0[sk_constraint_transform_var_rotation];
var sk_appliedTransform = argument0[sk_constraint_transform_var_appliedTransform];
var sk_translateMix = sk_appliedTransform[0];
var sk_scaleMix = sk_appliedTransform[1];
var sk_shearMix = sk_appliedTransform[2];
var sk_rotateMix = sk_appliedTransform[3];
switch((argument0[sk_constraint_transform_var_local]<<0)|(argument0[sk_constraint_transform_var_relative]<<1)){
	case 0: // not local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			sk_bone_interpolate_absolute_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 1: // local; not relative
		for(var sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			sk_bone_interpolate_absolute_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 2: // not local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			sk_bone_interpolate_relative_world(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
	case 3: // local; relative
		for(var sk_bone_id = 0; sk_bone_id<sk_boneCount; sk_bone_id++){
			sk_bone_interpolate_relative_local(
				sk_bones[| sk_bone_id],sk_boneTarget,
				sk_xoffset,sk_yoffset,sk_xscaleoffset,sk_yscaleoffset,sk_yshearoffset,sk_rotationoffset,
				sk_translateMix,sk_scaleMix,sk_shearMix,sk_rotateMix
			);
		}
	break;
}