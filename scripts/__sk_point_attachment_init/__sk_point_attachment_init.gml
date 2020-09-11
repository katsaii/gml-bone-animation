#macro SK_TYPE_POINT_ATTACHMENT "point_attachment"
enum sk_data_point_attachment{
	name,
	offsetX,offsetY,offsetRotation,
	worldX,worldY,worldRotation
}
/// @desc initialise
/// @param variable
sk_point_attachment_set_name(argument0,undefined);
sk_point_attachment_set_offsets(argument0,0,0,0);