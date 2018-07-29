/// @desc appends timeline data
/// @param timeline
/// @param time
var sk_itemOffsetTuple = ds_list_create();
sk_timeline_add_frame(argument0,argument1,sk_itemOffsetTuple);
var sk_keys = sk_timeline_keyframes(argument0);
ds_list_mark_as_list(sk_keys,ds_list_size(sk_keys)-1); // item offset tuple should be the last item in the list
return sk_itemOffsetTuple;