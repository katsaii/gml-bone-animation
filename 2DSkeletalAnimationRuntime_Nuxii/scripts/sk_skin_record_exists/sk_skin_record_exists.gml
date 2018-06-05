/// @desc determines whether the record exists
/// @param skin
/// @param slotOrSymbol
/// @param key
var sk_displays = argument0[SK_SKIN.displays];
var sk_display_last = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id+=sk_skin_record_length){
	if(
		(sk_displays[| sk_display_id+sk_skin_record_slot]==argument1)&&
		(sk_displays[| sk_display_id+sk_skin_record_attachmentKey]==argument2)
	){
		return true;
	}
}
return false;