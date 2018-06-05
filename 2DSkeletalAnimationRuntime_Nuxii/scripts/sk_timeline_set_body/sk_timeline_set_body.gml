#macro sk_timeline_header_keyframes 0
#macro sk_timeline_header_body 1
#macro sk_timeline_keyframe_time 0
#macro sk_timeline_keyframe_body 1
/// @desc sets the value for the body
/// @param timeline
/// @param value
argument0[@ sk_timeline_header_body] = argument1;
// perform timeline specific initialisation
switch(sk_struct_get_type(argument0)){
	case sk_type_timeline_symbol:
		var sk_nestedBone = noone;
		var sk_nestedSlot = noone;
		if(sk_struct_exists(argument1,sk_type_symbol)){
			// get nested structures
			sk_nestedBone = argument1[SK_SYMBOL.NESTED_BONE];
			sk_nestedSlot = argument1[SK_SYMBOL.NESTED_SLOT];
		}
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_TRANSLATE],sk_nestedBone);
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SCALE],sk_nestedBone);
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SHEAR],sk_nestedBone);
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_ROTATE],sk_nestedBone);
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_DISPLAY],sk_nestedSlot);
		sk_timeline_set_body(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_COLOUR],sk_nestedSlot);
	break;
}