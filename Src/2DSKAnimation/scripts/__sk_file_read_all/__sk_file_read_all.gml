/// @desc convert file contents to a string
/// @param filepath
var sk_context = "";
if(file_exists(argument0)){
	var sk_file = file_text_open_read(argument0);
	while(!file_text_eof(sk_file)){
		sk_context += file_text_readln(sk_file);
	}
	file_text_close(sk_file);
}
return sk_context;