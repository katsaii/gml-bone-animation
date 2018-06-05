/// @desc destructor
/// @param struct
ds_list_destroy(argument0[sk_timeline_header_keyframes]);
// perform timeline specific initialisation
switch(sk_struct_get_type(argument0)){
	case sk_type_timeline_symbol:
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_TRANSLATE]);
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SCALE]);
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SHEAR]);
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_ROTATE]);
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_DISPLAY]);
		sk_struct_destroy(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_COLOUR]);
	break;
}