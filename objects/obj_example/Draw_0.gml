/// @desc Render bones.
draw_set_colour(c_red);
bone_draw_debug(bone, mouse_x, mouse_y, 1, 1, 0, DebugKind.STRUCTURE | DebugKind.SIMPLE);
draw_set_colour(c_blue);
bone_draw_debug(bone2, mouse_x, mouse_y, 1, 1, 0, DebugKind.STRUCTURE | DebugKind.SIMPLE);
draw_text(mouse_x, mouse_y, bone2.worldTransform.getScaleX());
draw_text(mouse_x, mouse_y + 20, bone2.worldTransform.getScaleY());