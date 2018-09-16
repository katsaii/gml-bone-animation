#macro sk_type_bone sk_bone_create /*setting the id to the constructor ensures there are no collisions (script ids are unique)*/
enum SK_BONE{
	parent,length,transformMode,
	X,Y,XScale,YScale,XShear,YShear,rotation,
	XApplied,YApplied,XScaleApplied,YScaleApplied,XShearApplied,YShearApplied,rotationApplied,
	XWorld,YWorld,m00,m01,m10,m11,badApplied,transformModeCorrected,
	sizeof
}
#macro sk_transformMode_scale (1<<0)
#macro sk_transformMode_rotate (1<<1)
#macro sk_transformMode_translate (1<<2) /* translate, skew, and reflection are passive flags meaning they are not required */
#macro sk_transformMode_skew (1<<3) /* skewing transforms are a type of scale inheritance (not to be confused with shear transforms) */
#macro sk_transformMode_normal (sk_transformMode_scale|sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noRotation (sk_transformMode_scale|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScale (sk_transformMode_rotate|sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_noScaleOrRotation (sk_transformMode_translate|sk_transformMode_skew)
#macro sk_transformMode_none 0
#macro sk_transformMode_ex_spriter (sk_transformMode_normal&(~sk_transformMode_skew)) /* spriter specific transformMode */
/// @desc creates a new structure and returns its reference
/// @param name
/// @param parent
var sk_struct = array_create(SK_BONE.sizeof,noone);
// hook array
array_hook_sk_structure(
	sk_struct,sk_type_bone,argument0,
	"sk_bone_setToSetupPose", // setup script
	"sk_bone_updateWorldTransform", // apply script
	"sk_bone_destroy" // destruction script
);
// set default property values
sk_bone_set_parent(sk_struct,argument1);
sk_bone_set_length(sk_struct,100);
sk_bone_set_transformMode(sk_struct,sk_transformMode_normal);
sk_bone_set_position(sk_struct,0,0);
sk_bone_set_scale(sk_struct,1,1);
sk_bone_set_shear(sk_struct,0,0);
sk_bone_set_rotation(sk_struct,0);
// apply transforms
sk_bone_setToSetupPose(sk_struct);
sk_bone_updateWorldTransform(sk_struct);
// return to caller
return sk_struct;