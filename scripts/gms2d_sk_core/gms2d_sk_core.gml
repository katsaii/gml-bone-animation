/* Skeletal animation runtime
 * `https://github.com/NuxiiGit/gms2d-skeletal-animation`
 * Kat @Katsaii
 */

/// @desc Represents world data.
///       ```
///            X   Y   T
///       X | m00 m01 xPos |
///       Y | m10 m11 yPos |
///       ```
function Transform2D() constructor {
	/// @desc The x position of the transformation matrix.
	xPos = 0;
	/// @desc The y position of the transformation matrix.
	yPos = 0;
	/// @desc The top-left element of the transformation matrix.
	m00 = 1;
	/// @desc The top-right element of the transformation matrix.
	m01 = 0;
	/// @desc The bottom-left element of the transformation matrix.
	m10 = 0;
	/// @desc The bottom-right element of the transformation matrix.
	m11 = 1;
}

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
	/// @desc The x position of the bone.
	xPos = 0;
	/// @desc The y position of the bone.
	yPos = 0;
	/// @desc The x scale of the bone.
	xScale = 1;
	/// @desc The y scale of the bone.
	yScale = 1;
	/// @desc The x shear of the bone.
	xShear = 0;
	/// @desc The y shear of the bone.
	yShear = 0;
	/// @desc The rotation of the bone.
	angle = 0;
	/// @desc The transformation mode of the bone.
	mode = BoneTransformMode.NORMAL;
	/// @desc Copies the values of another `BoneData` into this.
	/// @param {BoneData} _other The `BoneData` to copy from.
	static copy = function(_other) {
		xPos = _other.xPos;
		yPos = _other.yPos;
		xScale = _other.xScale;
		yScale = _other.yScale;
		xShear = _other.xShear;
		yShear = _other.yShear;
		angle = _other.angle;
		mode = _other.mode;
	}
}

/// @desc Creates a new bone.
/// @param {Bone} parent The parent of the bone.
/// @param {Integer} length The length of the bone.
function Bone(_parent, _length) constructor {
	/// @desc The parent of the bone.
	par = _parent;
	/// @desc The length of the bone.
	len = _length;
	/// @desc The setup pose of the bone.
	setupPose = new BoneData();
	/// @desc The pose of the bone after animations are applied.
	localPose = new BoneData();
	invalidLocalPose = false;
	/// @desc The final world transform of the bone.
	worldTransform = new Transform2D();
	/// @desc Resets the local transforms of the bone.
	static setup = function() {
		localPose.copy(setupPose);
		invalidLocalPose = false;
	}
	/// @desc Updates the world transform of the bone.
	static update = function() {
		var x_pos = localPose.xPos;
		var y_pos = localPose.yPos;
		var x_scale = localPose.xScale;
		var y_scale = localPose.yScale;
		var x_shear = localPose.xShear;
		var y_shear = localPose.yShear;
		var angle = localPose.angle;
		var mode = localPose.mode;
		// get parent data
		if (par != undefined) {
			
		} else {
			// parent does not exist
			var x_angle = angle + x_shear;
			var y_angle = angle + y_shear + 90;
			worldTransform.xPos = x_pos;
			worldTransform.yPos = y_pos;
			worldTransform.m00 = dcos(x_angle) * x_scale;
			worldTransform.m01 = -dsin(x_angle) * x_scale;
			worldTransform.m10 = dcos(y_angle) * -y_scale;
			worldTransform.m11 = -dsin(y_angle) * -y_scale;
		}
		invalidLocalPose = false;
	}
}