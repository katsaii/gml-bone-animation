/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return clamp(__sk_hex_to_real(string_copy(sk_slot_rgba,argument1 ? 1 : 7,2))/255,0,1);