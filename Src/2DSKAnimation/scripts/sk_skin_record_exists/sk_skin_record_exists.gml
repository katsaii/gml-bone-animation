__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc determines whether the record exists
/// @param skin
/// @param slot
/// @param key
var sk_displays = argument0[sk_data_skin.displays];
var sk_display_count = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id<sk_display_count; sk_display_id++){
	var sk_display = sk_displays[| sk_display_id];
	if((sk_display[0]==argument1)&&(sk_display[2]==argument2)){
		return true;
	}
}
return false;