/* Skeletal animation runtime by Kat @Katsaii
 * `https://github.com/NuxiiGit/gms2d-skeletal-animation`
 */

/// @desc An enum which represents the available transformation modes of a bone when applying forward kinematics.
enum BoneTransformMode {
	NONE = 0,
	SCALE = 1 << 0,
	ROTATE = 1 << 1,
	TRANSLATE = 1 << 2,
	SKEW = 1 << 3,
	NORMAL = BoneTransformMode.SCALE |
			BoneTransformMode.ROTATE |
			BoneTransformMode.TRANSLATE |
			BoneTransformMode.SKEW,
	NO_ROTATION = BoneTransformMode.NORMAL &
			~BoneTransformMode.ROTATE,
	NO_SCALE = BoneTransformMode.NORMAL &
			~BoneTransformMode.SCALE,
	NO_ROTATION_OR_SCALE = BoneTransformMode.NORMAL &
			~(BoneTransformMode.ROTATE | BoneTransformMode.SCALE),
	NO_SKEW = BoneTransformMode.NORMAL &
			~BoneTransformMode.SKEW,
}

/// @desc Creates an empty bone transformation.
function BoneData() constructor {
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
function Bone(_parent, _length) constructor {
	par = _parent;
	len = _length;
	setupData = new BoneData();
	localData = new BoneData();
	invalidLocalData = false;
	xWorld = 0;
	yWorld = 0;
	m00 = 0;
	m01 = 0;
	m10 = 0;
	m11 = 0;
}