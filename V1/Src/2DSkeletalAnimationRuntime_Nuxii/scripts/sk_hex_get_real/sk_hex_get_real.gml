/// @desc Returns a decimal integer (real) representing the given hexadeciaml string.
/// @param hex
/// GMLscripts.com/license
var hex = string_upper(argument0);
var dec = 0;
var digit_count = string_length(hex); 
var digit;
for(digit = 1; digit <= digit_count; digit++){
	var pos = string_pos(string_char_at(hex,digit),"0123456789ABCDEF");
	if(pos){
		dec = (dec<<4)|(pos-1);
	}
}
return dec;