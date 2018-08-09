gml_pragma("global",@"
	vertex_format_begin();
	vertex_format_add_position();
	vertex_format_add_normal();
	vertex_format_add_colour();
	vertex_format_add_texcoord();
	global.sk_vformat_fullfat = vertex_format_end();
");
#macro sk_vertex_format global.sk_vformat_fullfat
/// @desc uses the supplied armature and atlas to build the supplied vertex buffer, then returns the ID of the texture page
/// @param armature
/// @param atlas
/// @param vbuff
var sk_armature_drawOrder = argument0[SK_ARMATURE.drawOrder];
var sk_atlas_subtextures = argument1[SK_ATLAS.subTextureMap];
var sk_texture_UVLeft = argument1[SK_ATLAS.UV_left];
var sk_texture_UVTop = argument1[SK_ATLAS.UV_top];
var sk_texture_UVRight = argument1[SK_ATLAS.UV_right];
var sk_texture_UVBottom = argument1[SK_ATLAS.UV_bottom];
// build buffer
vertex_begin(argument2,sk_vertex_format);
#region // create vertices
var sk_slot_count = ds_list_size(sk_armature_drawOrder); var sk_slot_id, sk_slot;
for(sk_slot_id = 0; sk_slot_id < sk_slot_count; sk_slot_id++){
	sk_slot = sk_armature_drawOrder[| sk_slot_id];
	if(SK_CONFIG_RELEASE_MODE||sk_struct_exists(sk_slot)){
		var sk_attachment = noone;
		var sk_bone = noone;
		var sk_colour = $ffffff;
		var sk_alpha = 1;
		switch(sk_struct_get_type(sk_slot)){
			case sk_type_slot:
				// obtain attachment and bone from slot
				sk_attachment = sk_slot[SK_SLOT.attachmentFinal];
				sk_bone = sk_slot[SK_SLOT.boneFinal];
				sk_colour = sk_slot[SK_SLOT.colourFinal];
				sk_alpha = sk_slot[SK_SLOT.alphaFinal];
			break;
			case sk_type_symbol:
				// obtain attachment and bone from symbol
				sk_symbol_updateWorldTransform(sk_slot);
				var sk_nestedSlot = sk_slot[SK_SYMBOL.NESTED_SLOT];
				sk_attachment = sk_nestedSlot[SK_SLOT.attachmentFinal];
				sk_bone = sk_slot[SK_SYMBOL.NESTED_BONE];
				sk_colour = sk_nestedSlot[SK_SLOT.colourFinal];
				sk_alpha = sk_nestedSlot[SK_SLOT.alphaFinal];
			break;
		}
		if(sk_struct_exists(sk_attachment)){
			switch(sk_struct_get_type(sk_attachment)){
				case sk_type_attachment_plane:
					// render region attachment
					var sk_attachment_subtexture = sk_atlas_subtextures[? sk_attachment[SK_ATTACHMENT_PLANE.regionKey]];
					if(sk_struct_exists(sk_attachment_subtexture,sk_type_region)){
						// get bone world transform
						var sk_bone_xpos = 0;
						var sk_bone_ypos = 0;
						var sk_bone_m00 = 1;
						var sk_bone_m01 = 0;
						var sk_bone_m10 = 0;
						var sk_bone_m11 = -1;
						if(sk_struct_exists(sk_bone,sk_type_bone)){
							sk_bone_xpos = sk_bone[SK_BONE.XWorld];
							sk_bone_ypos = sk_bone[SK_BONE.YWorld];
							sk_bone_m00 = sk_bone[SK_BONE.m00]; // x component of x
							sk_bone_m01 = sk_bone[SK_BONE.m01]; // y component of x
							sk_bone_m10 = sk_bone[SK_BONE.m10]; // x component of y
							sk_bone_m11 = sk_bone[SK_BONE.m11]; // y component of y
						}
						// get attachment transform
						var sk_att_dx = sk_attachment[SK_ATTACHMENT_PLANE.X];
						var sk_att_dy = sk_attachment[SK_ATTACHMENT_PLANE.Y];
						var sk_att_m00 = sk_attachment[SK_ATTACHMENT_PLANE.m00]; // x component of x
						var sk_att_m01 = sk_attachment[SK_ATTACHMENT_PLANE.m01]; // y component of x
						var sk_att_m10 = sk_attachment[SK_ATTACHMENT_PLANE.m10]; // x component of y
						var sk_att_m11 = sk_attachment[SK_ATTACHMENT_PLANE.m11]; // y component of y
						// multiply bone and attachment matrices
						var sk_region_xpos = sk_bone_xpos+sk_att_dx*sk_bone_m00+sk_att_dy*sk_bone_m10;
						var sk_region_ypos = sk_bone_ypos+sk_att_dx*sk_bone_m01+sk_att_dy*sk_bone_m11;
						var sk_region_m00 = (sk_att_m00*sk_bone_m00)+(sk_att_m01*sk_bone_m10);
						var sk_region_m01 = (sk_att_m00*sk_bone_m01)+(sk_att_m01*sk_bone_m11);
						var sk_region_m10 = (sk_att_m10*sk_bone_m00)+(sk_att_m11*sk_bone_m10);
						var sk_region_m11 = (sk_att_m10*sk_bone_m01)+(sk_att_m11*sk_bone_m11);
						// get normalised UVs
						var uv_ULX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_ULX]);
						var uv_ULY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_ULY]);
						var uv_URX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_URX]);
						var uv_URY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_URY]);
						var uv_BLX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_BLX]);
						var uv_BLY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_BLY]);
						var uv_BRX = lerp(sk_texture_UVLeft,sk_texture_UVRight,sk_attachment_subtexture[SK_REGION.uv_BRX]);
						var uv_BRY = lerp(sk_texture_UVTop,sk_texture_UVBottom,sk_attachment_subtexture[SK_REGION.uv_BRY]);
						// get region boundaries
						var sk_region_w = sk_attachment_subtexture[SK_REGION.width];
						var sk_region_h = sk_attachment_subtexture[SK_REGION.height];
						var sk_region_left = -sk_attachment_subtexture[SK_REGION.ox];
						var sk_region_top = -sk_attachment_subtexture[SK_REGION.oy];
						var sk_region_right = sk_region_left+sk_region_w;
						var sk_region_bottom = sk_region_top+sk_region_h;
						// get verts
						var v_x1 = sk_region_xpos+sk_region_m00*sk_region_left+sk_region_m10*sk_region_bottom; // bottom left
						var v_y1 = sk_region_ypos+sk_region_m01*sk_region_left+sk_region_m11*sk_region_bottom;
						var v_x2 = sk_region_xpos+sk_region_m00*sk_region_right+sk_region_m10*sk_region_bottom; // bottom right
						var v_y2 = sk_region_ypos+sk_region_m01*sk_region_right+sk_region_m11*sk_region_bottom;
						var v_x3 = sk_region_xpos+sk_region_m00*sk_region_left+sk_region_m10*sk_region_top; // top left
						var v_y3 = sk_region_ypos+sk_region_m01*sk_region_left+sk_region_m11*sk_region_top;
						var v_x4 = sk_region_xpos+sk_region_m00*sk_region_right+sk_region_m10*sk_region_top; // top right
						var v_y4 = sk_region_ypos+sk_region_m01*sk_region_right+sk_region_m11*sk_region_top;
						// add verticies to buffer
						#region // triad #1
						// bottom left
						vertex_position(argument2,v_x1,v_y1);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_BLX,uv_BLY);
						// bottom right
						vertex_position(argument2,v_x2,v_y2);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_BRX,uv_BRY);
						// top left
						vertex_position(argument2,v_x3,v_y3);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_ULX,uv_ULY);
						#endregion
						#region // triad #2
						// bottom right
						vertex_position(argument2,v_x2,v_y2);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_BRX,uv_BRY);
						// top right
						vertex_position(argument2,v_x4,v_y4);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_URX,uv_URY);
						// top left
						vertex_position(argument2,v_x3,v_y3);
						vertex_normal(argument2,0,0,-1);
						vertex_colour(argument2,sk_colour,sk_alpha);
						vertex_texcoord(argument2,uv_ULX,uv_ULY);
						#endregion
					}
				break;
			}
		}
	}
}
#endregion
vertex_end(argument2);
// return the texture page
return argument1[SK_ATLAS.texturePage];