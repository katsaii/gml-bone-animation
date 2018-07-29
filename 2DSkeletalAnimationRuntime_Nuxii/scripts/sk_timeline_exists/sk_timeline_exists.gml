/// @desc returns whether a timeline exists
/// @param timeline
return(
	sk_struct_exists(argument0)&&
	(argument0[SK_TIMELINE.header]==sk_timeline_header_value)
);