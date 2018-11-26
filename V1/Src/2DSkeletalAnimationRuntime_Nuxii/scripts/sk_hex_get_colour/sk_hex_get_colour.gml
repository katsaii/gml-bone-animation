/// @desc Returns the colour corresponding to the hex string
/// @param hex
/// @param inverse
var sk_slot_rgba = string_copy(argument0,0,8);
while(string_length(sk_slot_rgba)<8){ // fill empty data
	sk_slot_rgba += "F";
}
return(
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 7 : 1,2))<<0)+ // red
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 5 : 3,2))<<8)+ // green
	(sk_hex_get_real(string_copy(sk_slot_rgba,argument1 ? 3 : 5,2))<<16) // blue
);