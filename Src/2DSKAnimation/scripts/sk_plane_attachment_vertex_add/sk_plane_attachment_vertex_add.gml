__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_plane_attachment_exists(argument0);
/// @desc adds the plane verticies to the supplied vbuffer
/// @param attachment
/// @param vbuff
/// @param bone
/// @param colour
/// @param alpha
var sk_region = argument0[sk_data_plane_attachment.regionData];
if(sk_region!=undefined){
	// obtain world transform by multiplying attachment matrix by bone matrix
	var sk_att_dx = argument0[sk_data_plane_attachment.X];
	var sk_att_dy = argument0[sk_data_plane_attachment.Y];
	var sk_att_m00 = argument0[sk_data_plane_attachment.m00]; // x component of x
	var sk_att_m01 = argument0[sk_data_plane_attachment.m01]; // y component of x
	var sk_att_m10 = argument0[sk_data_plane_attachment.m10]; // x component of y
	var sk_att_m11 = argument0[sk_data_plane_attachment.m11]; // y component of y
	var sk_bone_x = argument2[sk_data_bone.worldX];
	var sk_bone_y = argument2[sk_data_bone.worldY];
	var sk_bone_m00 = argument2[sk_data_bone.m00];
	var sk_bone_m01 = argument2[sk_data_bone.m01];
	var sk_bone_m10 = argument2[sk_data_bone.m10];
	var sk_bone_m11 = argument2[sk_data_bone.m11];
	var sk_world_x = sk_bone_x+sk_att_dx*sk_bone_m00+sk_att_dy*sk_bone_m10;
	var sk_world_y = sk_bone_y+sk_att_dx*sk_bone_m01+sk_att_dy*sk_bone_m11;
	var sk_world_m00 = (sk_att_m00*sk_bone_m00)+(sk_att_m01*sk_bone_m10);
	var sk_world_m01 = (sk_att_m00*sk_bone_m01)+(sk_att_m01*sk_bone_m11);
	var sk_world_m10 = (sk_att_m10*sk_bone_m00)+(sk_att_m11*sk_bone_m10);
	var sk_world_m11 = (sk_att_m10*sk_bone_m01)+(sk_att_m11*sk_bone_m11);
	// get region boundaries
	var sk_region_ULX = sk_region[0];
	var sk_region_ULY = sk_region[1];
	var sk_region_URX = sk_region[2];
	var sk_region_URY = sk_region[3];
	var sk_region_BLX = sk_region[4];
	var sk_region_BLY = sk_region[5];
	var sk_region_BRX = sk_region[6];
	var sk_region_BRY = sk_region[7];
	var sk_region_left = -sk_region[8];
	var sk_region_top = -sk_region[9];
	var sk_region_right = sk_region_left+sk_region[10];
	var sk_region_bottom = sk_region_top+sk_region[11];
	// get verts
	var sk_x1 = sk_world_x+sk_world_m00*sk_region_left+sk_world_m10*sk_region_top; // top left
	var sk_y1 = sk_world_y+sk_world_m01*sk_region_left+sk_world_m11*sk_region_top;
	var sk_x2 = sk_world_x+sk_world_m00*sk_region_right+sk_world_m10*sk_region_top; // top right
	var sk_y2 = sk_world_y+sk_world_m01*sk_region_right+sk_world_m11*sk_region_top;
	var sk_x3 = sk_world_x+sk_world_m00*sk_region_right+sk_world_m10*sk_region_bottom; // bottom right
	var sk_y3 = sk_world_y+sk_world_m01*sk_region_right+sk_world_m11*sk_region_bottom;
	var sk_x4 = sk_world_x+sk_world_m00*sk_region_left+sk_world_m10*sk_region_bottom; // bottom left
	var sk_y4 = sk_world_y+sk_world_m01*sk_region_left+sk_world_m11*sk_region_bottom;
	// add verticies to buffer
	vertex_position(argument1,sk_x1,sk_y1); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_ULX,sk_region_ULY);
	vertex_position(argument1,sk_x2,sk_y2); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_URX,sk_region_URY);
	vertex_position(argument1,sk_x4,sk_y4); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BLX,sk_region_BLY);
	vertex_position(argument1,sk_x4,sk_y4); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BLX,sk_region_BLY);
	vertex_position(argument1,sk_x2,sk_y2); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_URX,sk_region_URY);
	vertex_position(argument1,sk_x3,sk_y3); vertex_colour(argument1,argument3,argument4); vertex_texcoord(argument1,sk_region_BRX,sk_region_BRY);
}