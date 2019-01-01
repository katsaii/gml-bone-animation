#macro sk_type_attachment_plane sk_attachment_create_plane
#macro sk_attachment_plane_var_regionKey 0
#macro sk_attachment_plane_var_x 1
#macro sk_attachment_plane_var_y 2
#macro sk_attachment_plane_var_m00 3
#macro sk_attachment_plane_var_m01 4
#macro sk_attachment_plane_var_m10 5
#macro sk_attachment_plane_var_m11 6
#macro sk_attachment_plane_var_regionData 7
/// @desc creates a new object and returns its reference
/// @param name
var sk_obj = sk_object_build_attachment(sk_type_attachment_plane,argument0,-1,"sk_attachment_plane_apply");
sk_obj[@ sk_attachment_plane_var_regionData] = undefined;
sk_attachment_plane_set_region(sk_obj,undefined);
sk_attachment_plane_set_matrix(sk_obj,0,0,1,1,0,0,0);
return sk_obj;