gml_pragma("forceinline");
/// @desc sets a property
/// @param timeline
/// @param value
var sk_scr_id = is_real(argument1) ? argument1 : asset_get_index(string(argument1));
argument0[@ SK_TIMELINE.keyframe_applyScript] = script_exists(sk_scr_id) ? sk_scr_id : -1;