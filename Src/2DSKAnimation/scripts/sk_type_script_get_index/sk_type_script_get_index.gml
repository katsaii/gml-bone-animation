/// @desc returns the script id if it exists, otherwise defaults to __sk_empty_script
/// @param type
/// @param function
/// @param [private]
var sk_script_path = (((argument_count>2)&&argument[2]) ? "__" : "")+"sk_"+string(argument[0])+"_"+string(argument[1]);
return asset_get_index((asset_get_type(sk_script_path)==asset_script) ? sk_script_path : "__sk_empty_script");