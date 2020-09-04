/* Bone Transformation Matrix
 * --------------------------
 * `https://github.com/NuxiiGit/gml-bone-animation`
 * Kat @Katsaii
 */

/*
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
	/// @desc Gets the rotation of the x basis vector
	static getRotationX = function() {
		return -darctan2(m01, m00);
	}
	/// @desc Gets the rotation of the y basis vector
	static getRotationY = function() {
		return -darctan2(m11, m10);
	}
	/// @desc Gets the magnitude of the x basis vector
	static getScaleX = function() {
		return point_distance(0, 0, m00, m01);
	}
	/// @desc Gets the magnitude of the y basis vector
	static getScaleY = function() {
		return point_distance(0, 0, m10, m11);
	}
	/// @desc Gets the magnitude of the y basis vector
	static getDeterminant = function() {
		return m00 * m11 - m01 * m10;
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