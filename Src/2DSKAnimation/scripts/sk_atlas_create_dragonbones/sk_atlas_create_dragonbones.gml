/// @desc builds an atlas from dragonbones json format
/// @param json
/// @param sprite
/// @param subimg
/// @param scale
var sk_atlas_sprite = argument1;
var sk_atlas_subimg = argument2;
var sk_atlas_scale = argument3;
var db_atlas = json_decode(argument0);
if(ds_exists(db_atlas,ds_type_map)){
	var db_atlas_subtextures = db_atlas[? "SubTexture"];
	if(is_real(db_atlas_subtextures)&&ds_exists(db_atlas_subtextures,ds_type_list)&&(!ds_list_empty(db_atlas_subtextures))){
		var db_texture_width = db_atlas[? "width"];
        var db_texture_height = db_atlas[? "height"];
        if(is_real(db_texture_width)&&(db_texture_width>0)&&is_real(db_texture_height)&&(db_texture_height>0)){
			// build final structure
			var sk_atlas = sk_atlas_create(db_atlas[? "name"]);
			#region // transfer atlas texture data to new structure
			var db_subtex_count = ds_list_size(db_atlas_subtextures); var db_subtex_id;
			for(db_subtex_id = 0; db_subtex_id < db_subtex_count; db_subtex_id++){
				var db_subtex_record = db_atlas_subtextures[| db_subtex_id];
				if(is_real(db_subtex_record)&&ds_exists(db_subtex_record,ds_type_map)){
				    var sk_tex_name = string(db_subtex_record[? "name"]);
				    var sk_tex_x = real(db_subtex_record[? "x"]); // defaults to '0' if not real
					var sk_tex_y = real(db_subtex_record[? "y"]);
					var sk_tex_w = real(db_subtex_record[? "width"]);
					var sk_tex_h = real(db_subtex_record[? "height"]);
					var sk_tex_dxframe = real(db_subtex_record[? "frameX"]);
					var sk_tex_dyframe = real(db_subtex_record[? "frameY"]);
					var sk_tex_wframe = is_real(db_subtex_record[? "frameWidth"]) ? db_subtex_record[? "frameWidth"] : sk_tex_w;
					var sk_tex_hframe = is_real(db_subtex_record[? "frameHeight"]) ? db_subtex_record[? "frameHeight"] : sk_tex_h;
					// insert
					sk_atlas_add_region(
						sk_atlas,
						sk_tex_name,
						sk_tex_x/db_texture_width,
						sk_tex_y/db_texture_height,
						(sk_tex_x+sk_tex_w)/db_texture_width,
						(sk_tex_y+sk_tex_h)/db_texture_height,
						(sk_tex_dxframe+sk_tex_wframe*0.5)*sk_atlas_scale, /* origin relative to top left */
						(sk_tex_dyframe+sk_tex_hframe*0.5)*sk_atlas_scale,
						sk_tex_w*sk_atlas_scale,
						sk_tex_h*sk_atlas_scale,
						0
					);
				}
			}
			#endregion
			// return final structure
			ds_map_destroy(db_atlas);
			// set page
			sk_atlas_set_page(sk_atlas,sk_atlas_sprite,sk_atlas_subimg);
			return sk_atlas;
        }
    }
	ds_map_destroy(db_atlas);
}
return undefined;