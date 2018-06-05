/// @desc returns the string containing all file data
/// @param path
var sk_rawtext = "";
if(file_exists(argument0)){
	var sk_file = file_text_open_read(argument0);
	while(!file_text_eof(sk_file)){
		sk_rawtext += file_text_read_string(sk_file)+"\n";
		file_text_readln(sk_file);
	}	file_text_close(sk_file);
}
return sk_rawtext;