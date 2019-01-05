/// @desc loads an atlas file
/// @param libgdx
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sk_sp_atlas = file_text_open_from_string(string(argument0));
// search for header
while(file_text_read_string(sk_sp_atlas)!=""){
	if(file_text_eof(sk_sp_atlas)){
		// header not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	file_text_readln(sk_sp_atlas);
}
// get image name
var sk_sp_name = "";
do{	// while the current line is not a statement, move to the next line
	file_text_readln(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)){
		// name not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	sk_sp_name = file_text_read_string(sk_sp_atlas);
}until(string_count(":",sk_sp_name)<1)
// get max atlas size
var sk_sp_size = "";
var sk_sp_texture_width = 0;
var sk_sp_texture_height = 0;
do{ // while the current line is a statement, move to the next line
	file_text_readln(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)){
		// name not found
		file_text_close(sk_sp_atlas);
		return undefined;
	}
	sk_sp_size = file_text_read_string(sk_sp_atlas);
	if(string_count(":",sk_sp_size)>0){
		var sk_sp_delimiter = string_pos(":",sk_sp_size);
		if(string_replace_all(string_copy(sk_sp_size,0,sk_sp_delimiter)," ","")=="size:"){
			var sk_sp_size_vector = string_replace_all(string_copy(sk_sp_size,sk_sp_delimiter+1,string_length(sk_sp_size)-sk_sp_delimiter)," ","");
			if(string_count(",",sk_sp_size)>0){
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_size_vector);
				sk_sp_texture_width = real(string_copy(sk_sp_size_vector,0,sk_sp_vector_delimiter-1));
				sk_sp_texture_height = real(string_copy(sk_sp_size_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_size_vector)-sk_sp_vector_delimiter));
			} else { // uniform size
				sk_sp_texture_width = real(sk_sp_size_vector);
				sk_sp_texture_height = sk_sp_texture_width;
			}
			break;
		}
	}
}until(false)
if((sk_sp_texture_width<1)||(sk_sp_texture_height<1)){
	// size is invalid
	file_text_close(sk_sp_atlas);
	return undefined;
}
// build atlas
var sk_atlas = sk_atlas_create();
// add regions
var sk_current_exists = false;
var sk_current_name = "";
var sk_current_x = 0;
var sk_current_y = 0;
var sk_current_w = 0;
var sk_current_h = 0;
var sk_current_xframe = 0;
var sk_current_yframe = 0;
var sk_current_wframe = 0;
var sk_current_hframe = 0;
var sk_current_rotation = 0;
do{
	file_text_readln(sk_sp_atlas);
	var sk_sp_data = file_text_read_string(sk_sp_atlas);
	if(file_text_eof(sk_sp_atlas)||(sk_sp_data=="")||(string_count(":",sk_sp_data)<1)){
		// current line is a statement, apply current attributes to current region and add it to the atlas
		if(sk_current_exists){
			var sk_tex_dx = (sk_current_rotation>45) ? sk_current_h : sk_current_w;
			var sk_tex_dy = (sk_current_rotation>45) ? sk_current_w : sk_current_h;
			sk_atlas_add_region(
				sk_atlas,
				sk_current_name,
				sk_current_x/sk_sp_texture_width,
				sk_current_y/sk_sp_texture_height,
				(sk_current_x+sk_tex_dx)/sk_sp_texture_width,
				(sk_current_y+sk_tex_dy)/sk_sp_texture_height,
				(sk_current_xframe+sk_current_wframe*0.5)*sk_atlas_scale,
				(sk_current_yframe+sk_current_hframe*0.5)*sk_atlas_scale,
				sk_current_w*sk_atlas_scale,
				sk_current_h*sk_atlas_scale,
				sk_current_rotation
			);
			// reset attributes for next round
			sk_current_x = 0;
			sk_current_y = 0;
			sk_current_w = 0;
			sk_current_h = 0;
			sk_current_xframe = 0;
			sk_current_yframe = 0;
			sk_current_wframe = 0;
			sk_current_hframe = 0;
			sk_current_rotation = 0;
		} else {
			// set initialisation flag for first cycle
			sk_current_exists = true;
		}
		if(file_text_eof(sk_sp_atlas)||(sk_sp_data=="")){
			// end reached
			file_text_close(sk_sp_atlas);
			break;
		} else {
			// set the next region's name
			sk_current_name = string(sk_sp_data);
		}
	} else {
		// current line is a assignment, set the current attribute for future use
		var sk_sp_delimiter = string_pos(":",sk_sp_data);
		var sk_sp_data_vector = string_replace_all(string_copy(sk_sp_data,sk_sp_delimiter+1,string_length(sk_sp_data)-sk_sp_delimiter)," ","");
		switch(string_replace_all(string_copy(sk_sp_data,0,sk_sp_delimiter)," ","")){
			case "rotate:":
				sk_current_rotation = (sk_sp_data_vector=="true") ? 90 : 0;
				//show_message(sk_sp_data_vector+" -> "+string(sk_sp_data_vector=="true"));
			break;
			case "xy:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_x = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_y = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "size:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_w = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_h = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "orig:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_wframe = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_hframe = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
			case "offset:":
				var sk_sp_vector_delimiter = string_pos(",",sk_sp_data_vector);
				sk_current_xframe = real(string_copy(sk_sp_data_vector,0,sk_sp_vector_delimiter-1));
				sk_current_yframe = real(string_copy(sk_sp_data_vector,sk_sp_vector_delimiter+1,string_length(sk_sp_data_vector)-sk_sp_vector_delimiter));
			break;
		}
	}
}until(false)
// set page
sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
return sk_atlas;