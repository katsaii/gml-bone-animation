/// @desc constructor
/// @param struct
argument0[@ sk_timeline_header_keyframes] = ds_list_create();
// perform timeline specific initialisation
switch(sk_struct_get_type(argument0)){
	case sk_type_timeline_symbol:
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_TRANSLATE] = sk_timeline_create_translate("translate",noone);
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SCALE] = sk_timeline_create_translate("scale",noone);
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SHEAR] = sk_timeline_create_translate("shear",noone);
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_ROTATE] = sk_timeline_create_translate("rotate",noone);
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_DISPLAY] = sk_timeline_create_translate("display",noone);
		argument0[@ SK_TIMELINE_SYMBOL.NESTED_TIMELINE_COLOUR] = sk_timeline_create_translate("colour",noone);
	break;
}