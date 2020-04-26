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
	var sine = _angle == 0.0 ? 0.0 : dsin(_angle);
	var cosine = _angle == 0.0 ? 1.0 : dcos(_angle);
	// transform by global scale
	var world = _bone.worldData;
	var local_x = world.xPos * _xscale;
	var local_y = world.yPos * _yscale;
	var local_m00 = world.m00 * _xscale; // x component of x basis
	var local_m01 = world.m01 * _yscale; // y component of x basis
	var local_m10 = world.m10 * _xscale; // x component of y basis
	var local_m11 = world.m11 * _yscale; // y component of y basis
	// transform by global rotation
	var world_x = local_x * cosine + local_y * sine;
	var world_y = local_x * -sine + local_y * cosine;
	var world_m00 = local_m00 * cosine + local_m01 * sine;
	var world_m01 = local_m00 * -sine + local_m01 * cosine;
	var world_m10 = local_m10 * cosine + local_m11 * sine;
	var world_m11 = local_m10 * -sine + local_m11 * cosine;
	// transform by global translation
	world_x += _x;
	world_y += _y;
	// render bone
	if (_debug_kind	& DebugKind.STRUCTURE) {
		var len = _bone.len;
		if (_debug_kind	& DebugKind.SIMPLE) {
			var x1 = world_x;
			var y1 = world_y;
			var x2 = x1 + len * world_m00;
			var y2 = y1 + len * world_m01;
			draw_line(x1, y1, x2, y2);
		}
	}
}