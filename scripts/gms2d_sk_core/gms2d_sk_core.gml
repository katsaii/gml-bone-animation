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
function WorldTransform2D() constructor {
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
	/// @desc Sets the position of the transformation matrix.
	/// @param {real} x The x position to set.
	/// @param {real} y The y position to set.
	static setPosition = function(_x, _y) {
		xPos = _x;
		yPos = _y;
	}
	/// @desc Sets the rotation of the x basis vector
	/// @param {real} angle The angle of the x basis vector.
	/// @param {real} scale The length of the x basis vector.
	static setRotationX = function(_angle, _scale) {
		m00 = dcos(_angle) * _scale;
		m01 = -dsin(_angle) * _scale;
	}
	/// @desc Sets the rotation of the y basis vector
	/// @param {real} angle The angle of the y basis vector.
	/// @param {real} scale The length of the y basis vector.
	static setRotationY = function(_angle, _scale) {
		m10 = dcos(_angle) * -_scale;
		m11 = -dsin(_angle) * -_scale;
	}
	/// @desc Multiplies this matrix by some parent.
	/// @param {WorldTransform2D} parent The parent transform to multiply by
	static multiply = function(_parent) {
		var my_m00 = m00;
		var my_m01 = m01;
		var my_m10 = m10;
		var my_m11 = m11;
		m00 = my_m00 * _parent.m00 + my_m01 * _parent.m10;
		m01 = my_m00 * _parent.m01 + my_m01 * _parent.m11;
		m10 = my_m10 * _parent.m00 + my_m11 * _parent.m10;
		m11 = my_m10 * _parent.m01 + my_m11 * _parent.m11;
	}
	/// @desc Applies the linear transformation to this vertex and returns a `vec2`.
	/// @param {real} x The x position to transform.
	/// @param {real} y The y position to transform.
	static transformVertex = function(_x, _y) {
		var vx = _x * m00 + _y * m01 + xPos;
		var vy = _x * m10 + _y * m11 + yPos;
		return [vx, vy];
	}
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
	worldTransform = new WorldTransform2D();
	/// @desc Resets the local transforms of the bone.
	static setup = function() {
		localPose.copy(setupPose);
		invalidLocalPose = false;
	}
	/// @desc Updates the world transform of the bone.
	static update = function() {
		invalidLocalPose = false;
		var x_pos = localPose.xPos;
		var y_pos = localPose.yPos;
		var x_scale = localPose.xScale;
		var y_scale = localPose.yScale;
		var x_shear = localPose.xShear;
		var y_shear = localPose.yShear;
		var x_angle = localPose.angle + x_shear;
		var y_angle = localPose.angle + y_shear + 90;
		var mode = localPose.mode;
		// get parent data
		var world_space = worldTransform;
		if (par != undefined) {
			var parent_space = par.worldTransform;
			// inherit translation
			if (mode & BoneTransformMode.TRANSLATE) {
				var pos = parent_space.transformVertex(x_pos, y_pos);
				world_space.setPosition(pos[0], pos[1]);
				mode &= ~BoneTransformMode.TRANSLATE;
			} else {
				// don't
				world_space.setPosition(x_pos, y_pos);
			}
			// inherit skew
			if (mode & BoneTransformMode.SKEW) {
				mode &= ~BoneTransformMode.SKEW;
			}
			// inherit other transform methods
			switch (mode) {
			case BoneTransformMode.SCALE | BoneTransformMode.ROTATE:
				world_space.setRotationX(x_angle, x_scale);
				world_space.setRotationY(y_angle, y_scale);
				world_space.multiply(parent_space);
				return;
			}
		} else {
			world_space.setPosition(x_pos, y_pos);
		}
		// don't inherit anything, use applied transform
		world_space.setRotationX(x_angle, x_scale);
		world_space.setRotationY(y_angle, y_scale);
	}
}