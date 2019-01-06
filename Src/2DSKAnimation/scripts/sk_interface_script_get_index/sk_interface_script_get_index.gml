/// @desc returns the script id if it exists, otherwise defaults to __sk_empty_script
/// @param interface
/// @param function
var sk_script_path = "__sk_"+string(argument0)+"_"+string(argument1);
return asset_get_index((asset_get_type(sk_script_path)==asset_script) ? sk_script_path : "__sk_empty_script");