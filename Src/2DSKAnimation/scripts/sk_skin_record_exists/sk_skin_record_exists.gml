/// @desc determines whether the record exists
/// @param skin
/// @param slotOrSymbol
/// @param key
var sk_displays = argument0[sk_skin_var_displays];
var sk_display_last = ds_list_size(sk_displays);
for(var sk_display_id = 0; sk_display_id < sk_display_last; sk_display_id++){
	var sk_display = sk_displays[| sk_display_id];
	if((sk_display[0]==argument1)&&(sk_display[2]==argument2)) then return true;
}
return false;