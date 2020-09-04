/* Bone Transformation
 * -------------------
 * `https://github.com/NuxiiGit/gml-bone-animation`
 * Kat @Katsaii
 */

#macro BONE_DEFAULT_LENGTH 10

/// @desc An enum which represents the available transformation modes of a bone when applying forward kinematics.
enum BoneTransformMode {
	NONE = 0,
	SCALE = 0x01,
	ROTATE = BoneTransformMode.SCALE << 1,
	TRANSLATE = BoneTransformMode.ROTATE << 2,
	NORMAL = BoneTransformMode.SCALE |
			BoneTransformMode.ROTATE |
			BoneTransformMode.TRANSLATE,
	NO_ROTATION = BoneTransformMode.NORMAL &
			~BoneTransformMode.ROTATE,
	NO_SCALE = BoneTransformMode.NORMAL &
			~BoneTransformMode.SCALE,
	NO_ROTATION_OR_SCALE = BoneTransformMode.NORMAL &
			~(BoneTransformMode.ROTATE | BoneTransformMode.SCALE),
}

/// @desc Creates an empty bone pose.
function BonePose() constructor {
	xPos = 0;
	yPos = 0;
	xScale = 1;
	yScale = 1;
	xShear = 0;
	yShear = 0;
	angle = 0;
	mode = BoneTransformMode.NORMAL;
}

/// @desc Creates a new bone.
function Bone(_parent) constructor {
	par = undefined;
	len = BONE_DEFAULT_LENGTH;
	setupPose = new BonePose();
	localPose = new BonePose();
	invalidLocalPose = false;
	matrix = matrix_build_identity();
}