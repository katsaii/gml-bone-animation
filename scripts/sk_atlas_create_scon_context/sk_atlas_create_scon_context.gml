/// @desc loads an atlas file
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var sk_sp_atlas = json_decode(argument0);
if(ds_exists(sk_sp_atlas,ds_type_map)){
	var sk_sp_atlas_frames = sk_sp_atlas[? "frames"];
	var sk_sp_atlas_metaData = sk_sp_atlas[? "meta"];
	if(
		is_real(sk_sp_atlas_frames)&&ds_exists(sk_sp_atlas_frames,ds_type_list)&&(!ds_list_empty(sk_sp_atlas_frames))&&
		is_real(sk_sp_atlas_metaData)&&ds_exists(sk_sp_atlas_metaData,ds_type_map)
	){
		var sk_sp_texture_scale = sk_sp_atlas_metaData[? "scale"];
		var sk_sp_texture_size = sk_sp_atlas_metaData[? "size"];
		if(is_real(sk_sp_texture_size)&&ds_exists(sk_sp_texture_size,ds_type_map)){
			var sk_sp_texture_width = sk_sp_texture_size[? "w"];
			var sk_sp_texture_height = sk_sp_texture_size[? "h"];
			if(is_real(sk_sp_texture_width)&&(sk_sp_texture_width>0)&&is_real(sk_sp_texture_height)&&(sk_sp_texture_height>0)){
				// build final structure
				var sk_atlas = sk_atlas_create();
				#region // transfer atlas texture data to new structure
				var sk_sp_subtex_count = ds_list_size(sk_sp_atlas_frames); var sk_sp_subtex_id;
				for(sk_sp_subtex_id = 0; sk_sp_subtex_id < sk_sp_subtex_count; sk_sp_subtex_id++){
					var sk_sp_subtex_record = sk_sp_atlas_frames[| sk_sp_subtex_id];
					if(is_real(sk_sp_subtex_record)&&ds_exists(sk_sp_subtex_record,ds_type_map)){
						var sk_tex_path = string(sk_sp_subtex_record[? "filename"]);
						var sk_tex_rotate = sk_sp_subtex_record[? "rotated"]=="true";
						var sk_tex_x = 0;
						var sk_tex_y = 0;
						var sk_tex_w = 0;
						var sk_tex_h = 0;
						var sk_tex_dxframe = 0;
						var sk_tex_dyframe = 0;
						var sk_tex_wframe = 0;
						var sk_tex_hframe = 0;
						// get frame data
						var sk_sp_subtex_frameData = sk_sp_subtex_record[? "frame"];
						if(is_real(sk_sp_subtex_frameData)&&ds_exists(sk_sp_subtex_frameData,ds_type_map)){
							sk_tex_x = real(sk_sp_subtex_frameData[? "x"]); // defaults to '0' if not real
							sk_tex_y = real(sk_sp_subtex_frameData[? "y"]);
							sk_tex_w = real(sk_sp_subtex_frameData[? "w"]);
							sk_tex_h = real(sk_sp_subtex_frameData[? "h"]);
						}
						// get source offset
						var sk_sp_subtex_sourceSpriteSize = sk_sp_subtex_record[? "spriteSourceSize"];
						if(is_real(sk_sp_subtex_sourceSpriteSize)&&ds_exists(sk_sp_subtex_sourceSpriteSize,ds_type_map)){
							sk_tex_dxframe = -real(sk_sp_subtex_sourceSpriteSize[? "x"]);
							sk_tex_dyframe = -real(sk_sp_subtex_sourceSpriteSize[? "y"]);
						}
						// get source size
						var sk_sp_subtex_sourceSize = sk_sp_subtex_record[? "sourceSize"];
						if(is_real(sk_sp_subtex_sourceSize)&&ds_exists(sk_sp_subtex_sourceSize,ds_type_map)){
							sk_tex_wframe = real(sk_sp_subtex_sourceSize[? "w"]);
							sk_tex_hframe = real(sk_sp_subtex_sourceSize[? "h"]);
						}
						// insert
						var sk_tex_dx = sk_tex_rotate ? sk_tex_h : sk_tex_w;
						var sk_tex_dy = sk_tex_rotate ? sk_tex_w : sk_tex_h;
						sk_atlas_add_region(
							sk_atlas,
							sk_tex_path,
							sk_tex_x/sk_sp_texture_width,
							sk_tex_y/sk_sp_texture_height,
							(sk_tex_x+sk_tex_dx)/sk_sp_texture_width,
							(sk_tex_y+sk_tex_dy)/sk_sp_texture_height,
							(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
							(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
							sk_tex_w*sk_atlas_scale,
							sk_tex_h*sk_atlas_scale,
							sk_tex_rotate*-90 /* rotate the UVs 90 degrees clockwise */
						);
					}
				}
				#endregion
				// return final structure
				ds_map_destroy(sk_sp_atlas);
				// set page
				sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
				return sk_atlas;
			}
		}
	}
	ds_map_destroy(sk_sp_atlas);
}
return undefined;