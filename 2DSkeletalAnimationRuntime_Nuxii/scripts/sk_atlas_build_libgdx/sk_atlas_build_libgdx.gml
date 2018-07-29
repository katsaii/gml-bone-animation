/// @desc loads an atlas file
/// @param libgx
/// @param scale
var sk_atlas_scale = argument1;
var sp_atlas = file_text_open_from_string(string(argument0));
// search for header
while(file_text_read_string(sp_atlas)!=""){
	if(file_text_eof(sp_atlas)){
		// header not found
		file_text_close(sp_atlas);
		return noone;
	}
	file_text_readln(sp_atlas);
}
// get image name
var sp_name = "";
do{	// while the current line is not a statement, move to the next line
	file_text_readln(sp_atlas);
	if(file_text_eof(sp_atlas)){
		// name not found
		file_text_close(sp_atlas);
		return noone;
	}
	sp_name = file_text_read_string(sp_atlas);
}until(string_count(":",sp_name)<1)
// get max atlas size
var sp_size = "";
var sp_texture_width = 0;
var sp_texture_height = 0;
do{ // while the current line is a statement, move to the next line
	file_text_readln(sp_atlas);
	if(file_text_eof(sp_atlas)){
		// name not found
		file_text_close(sp_atlas);
		return noone;
	}
	sp_size = file_text_read_string(sp_atlas);
	if(string_count(":",sp_size)>0){
		var sp_delimiter = string_pos(":",sp_size);
		if(string_replace_all(string_copy(sp_size,0,sp_delimiter)," ","")=="size:"){
			var sp_size_vector = string_replace_all(string_copy(sp_size,sp_delimiter+1,string_length(sp_size)-sp_delimiter)," ","");
			if(string_count(",",sp_size)>0){
				var sp_vector_delimiter = string_pos(",",sp_size_vector);
				sp_texture_width = real(string_copy(sp_size_vector,0,sp_vector_delimiter-1));
				sp_texture_height = real(string_copy(sp_size_vector,sp_vector_delimiter+1,string_length(sp_size_vector)-sp_vector_delimiter));
			} else { // uniform size
				sp_texture_width = real(sp_size_vector);
				sp_texture_height = sp_texture_width;
			}
			break;
		}
	}
}until(false)
if((sp_texture_width<1)||(sp_texture_height<1)){
	// size is invalid
	file_text_close(sp_atlas);
	return noone;
}
// build atlas
var sk_atlas = sk_struct_create(sk_type_atlas,sp_name);
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
	file_text_readln(sp_atlas);
	var sp_data = file_text_read_string(sp_atlas);
	if(file_text_eof(sp_atlas)||(sp_data=="")||(string_count(":",sp_data)<1)){
		// current line is a statement, apply current attributes to current region and add it to the atlas
		if(sk_current_exists){
			var sk_tex = sk_struct_create(sk_type_region,sk_current_name);
			var sk_tex_dx = (sk_current_rotation>45) ? sk_current_h : sk_current_w;
			var sk_tex_dy = (sk_current_rotation>45) ? sk_current_w : sk_current_h;
			sk_region_set_uvs(
				sk_tex,
				sk_current_x/sp_texture_width,
				sk_current_y/sp_texture_height,
				(sk_current_x+sk_tex_dx)/sp_texture_width,
				(sk_current_y+sk_tex_dy)/sp_texture_height,
				(sk_current_xframe+sk_current_wframe*0.5)*sk_atlas_scale,
				(sk_current_yframe+sk_current_hframe*0.5)*sk_atlas_scale,
				sk_current_w*sk_atlas_scale,
				sk_current_h*sk_atlas_scale,
				sk_current_rotation
			);
			sk_atlas_add_subtextureRegion(sk_atlas,sk_tex,sk_current_name);
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
		if(file_text_eof(sp_atlas)||(sp_data=="")){
			// end reached
			file_text_close(sp_atlas);
			break;
		} else {
			// set the next region's name
			sk_current_name = string(sp_data);
		}
	} else {
		// current line is a assignment, set the current attribute for future use
		var sp_delimiter = string_pos(":",sp_data);
		var sp_data_vector = string_replace_all(string_copy(sp_data,sp_delimiter+1,string_length(sp_data)-sp_delimiter)," ","");
		switch(string_replace_all(string_copy(sp_data,0,sp_delimiter)," ","")){
			case "rotate:":
				sk_current_rotation = (sp_data_vector=="true") ? 90 : 0;
				//show_message(sp_data_vector+" -> "+string(sp_data_vector=="true"));
			break;
			case "xy:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_x = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_y = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "size:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_w = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_h = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "orig:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_wframe = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_hframe = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
			case "offset:":
				var sp_vector_delimiter = string_pos(",",sp_data_vector);
				sk_current_xframe = real(string_copy(sp_data_vector,0,sp_vector_delimiter-1));
				sk_current_yframe = real(string_copy(sp_data_vector,sp_vector_delimiter+1,string_length(sp_data_vector)-sp_vector_delimiter));
			break;
		}
	}
}until(false)
// return final atlas
return sk_atlas;