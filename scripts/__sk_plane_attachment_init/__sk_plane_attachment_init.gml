#macro SK_TYPE_PLANE_ATTACHMENT "plane_attachment"
enum sk_data_plane_attachment{
	name,
	regionKey,
	regionData,
	X,Y,
	m00,m01,m10,m11
}
/// @desc initialise
/// @param variable
argument0[@ sk_data_plane_attachment.regionData] = undefined;
sk_plane_attachment_set_name(argument0,undefined);
sk_plane_attachment_set_regionKey(argument0,undefined);
sk_plane_attachment_set_matrix(argument0,0,0,1,1,0,0,0);