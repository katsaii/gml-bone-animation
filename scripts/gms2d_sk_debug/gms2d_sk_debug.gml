/* Skeletal animation runtime debug tools
 * `https://github.com/NuxiiGit/gms2d-skeletal-animation`
 * Kat @Katsaii
 */

/// @desc Represents the debug arguments of the various debug tools.
enum DebugKind {
	DATA = 0x01,
	STRUCTURE = DebugKind.DATA << 1,
	SIMPLE = DebugKind.STRUCTURE << 1
}

/// @desc Draws a debug version of a bone.
/// @param {Bone} bone The bone to render.
/// @param {real} x The x offset.
/// @param {real} y The y offset.
/// @param {real} xscale The x scale factor.
/// @param {real} yscale The y scale factor.
/// @param {real} angle The rotational offset.
/// @param {DebugKind} debug_kind The debug arguments given by `DebugKind`.
function bone_draw_debug(_bone, _x, _y, _xscale, _yscale, _angle, _debug_kind) {
	var rotation_space = new WorldTransform2D();
	rotation_space.setRotationX(_angle, 1);
	rotation_space.setRotationY(_angle + 90, 1);
	var world_space = _bone.worldTransform;
	var origin = rotation_space.transformVertex(
			world_space.xPos * _xscale,
			world_space.yPos * _yscale);
	var x_basis = rotation_space.transformVertex(
			world_space.m00 * _xscale,
			world_space.m01 * _yscale);
	var y_basis = rotation_space.transformVertex(
			world_space.m10 * _xscale,
			world_space.m11 * _yscale);
	var debug_space = new WorldTransform2D();
	debug_space.xPos = origin[0] + _x;
	debug_space.yPos = origin[1] + _y;
	debug_space.m00 = x_basis[0];
	debug_space.m01 = x_basis[1];
	debug_space.m10 = y_basis[0];
	debug_space.m11 = y_basis[1];
	// render bone
	if (_debug_kind	& DebugKind.STRUCTURE) {
		var len = _bone.len;
		if (_debug_kind	& DebugKind.SIMPLE) {
			var ox = debug_space.xPos;
			var oy = debug_space.yPos;
			var tip = debug_space.transformVertex(len, 0);
			draw_line(ox, oy, tip[0], tip[1]);
		}
	}
}