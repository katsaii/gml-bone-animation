/// @desc loads an atlas file
/// @param json
/// @param scale
var sk_atlas_scale = argument1;
var sp_atlas = json_decode(argument0);
if(ds_exists(sp_atlas,ds_type_map)){
	var sp_atlas_frames = sp_atlas[? "frames"];
	var sp_atlas_metaData = sp_atlas[? "meta"];
	if(is_real(sp_atlas_frames)&&ds_exists(sp_atlas_frames,ds_type_list)&&(!ds_list_empty(sp_atlas_frames))
	&& is_real(sp_atlas_metaData)&&ds_exists(sp_atlas_metaData,ds_type_map)){
		var sp_texture_scale = sp_atlas_metaData[? "scale"];
		var sp_texture_size = sp_atlas_metaData[? "size"];
		if(is_real(sp_texture_size)&&ds_exists(sp_texture_size,ds_type_map)){
			var sp_texture_width = sp_texture_size[? "w"];
			var sp_texture_height = sp_texture_size[? "h"];
			if(is_real(sp_texture_width)&&(sp_texture_width>0)&&is_real(sp_texture_height)&&(sp_texture_height>0)){
				// build final structure
				var sk_atlas = sk_atlas_create(sp_atlas_metaData[? "image"]);
				#region // transfer atlas texture data to new structure
				var sp_subtex_count = ds_list_size(sp_atlas_frames); var sp_subtex_id;
				for(sp_subtex_id = 0; sp_subtex_id < sp_subtex_count; sp_subtex_id++){
					var sp_subtex_record = sp_atlas_frames[| sp_subtex_id];
					if(is_real(sp_subtex_record)&&ds_exists(sp_subtex_record,ds_type_map)){
						var sk_tex_path = string(sp_subtex_record[? "filename"]);
						var sk_tex_rotate = sp_subtex_record[? "rotated"]=="true";
						var sk_tex_x = 0;
						var sk_tex_y = 0;
						var sk_tex_w = 0;
						var sk_tex_h = 0;
						var sk_tex_dxframe = 0;
						var sk_tex_dyframe = 0;
						var sk_tex_wframe = 0;
						var sk_tex_hframe = 0;
						// get frame data
						var sp_subtex_frameData = sp_subtex_record[? "frame"];
						if(is_real(sp_subtex_frameData)&&ds_exists(sp_subtex_frameData,ds_type_map)){
							sk_tex_x = real(sp_subtex_frameData[? "x"]); // defaults to '0' if not real
							sk_tex_y = real(sp_subtex_frameData[? "y"]);
							sk_tex_w = real(sp_subtex_frameData[? "w"]);
							sk_tex_h = real(sp_subtex_frameData[? "h"]);
						}
						// get source offset
						var sp_subtex_sourceSpriteSize = sp_subtex_record[? "spriteSourceSize"];
						if(is_real(sp_subtex_sourceSpriteSize)&&ds_exists(sp_subtex_sourceSpriteSize,ds_type_map)){
							sk_tex_dxframe = -real(sp_subtex_sourceSpriteSize[? "x"]);
							sk_tex_dyframe = -real(sp_subtex_sourceSpriteSize[? "y"]);
						}
						// get source size
						var sp_subtex_sourceSize = sp_subtex_record[? "sourceSize"];
						if(is_real(sp_subtex_sourceSize)&&ds_exists(sp_subtex_sourceSize,ds_type_map)){
							sk_tex_wframe = real(sp_subtex_sourceSize[? "w"]);
							sk_tex_hframe = real(sp_subtex_sourceSize[? "h"]);
						}
						// insert
						var sk_tex = sk_region_create(sk_tex_path);
						var sk_tex_dx = sk_tex_rotate ? sk_tex_h : sk_tex_w;
						var sk_tex_dy = sk_tex_rotate ? sk_tex_w : sk_tex_h;
						sk_region_set_uvs(
							sk_tex,
							sk_tex_x/sp_texture_width,
							sk_tex_y/sp_texture_height,
							(sk_tex_x+sk_tex_dx)/sp_texture_width,
							(sk_tex_y+sk_tex_dy)/sp_texture_height,
							(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
							(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
							sk_tex_w*sk_atlas_scale,
							sk_tex_h*sk_atlas_scale,
							sk_tex_rotate*-90 /* rotate the UVs 90 degrees clockwise */
						);
						sk_atlas_add_subtextureRegion(sk_atlas,sk_tex,sk_tex_path);
					}
				}
				#endregion
				// return final structure
				ds_map_destroy(sp_atlas);
				return sk_atlas;
			}
		}
	}
	ds_map_destroy(sp_atlas);
}
return noone;