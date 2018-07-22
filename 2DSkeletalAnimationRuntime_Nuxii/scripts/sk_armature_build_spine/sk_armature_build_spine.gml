/// @desc loads an armature file
/// @param json
/// @param armatureNameOrID
var sp_armature = noone;
// extract armature data from spriter json
var sp_skel = json_decode(argument0);
if(ds_exists(sp_skel,ds_type_map)){
	/*
		SPINE ONLY HAS A SINGLE ARMATURE; the supplied armature name is only used to name the armature, and could be anything!
	*/
	sp_armature = sp_skel;
} else {
	return noone;
}
// extract important data
var sp_meta = sp_armature[? "skeleton"];
var sp_bones = sp_armature[? "bones"];
var sp_slots = sp_armature[? "slots"];
var sp_skins = sp_armature[? "skins"];
var sp_constraints_IK = sp_armature[? "ik"];
var sp_constraints_transform = sp_armature[? "transform"];
var sp_constraints_path = sp_armature[? "path"]; // not used
var sp_animations = sp_armature[? "animations"];
var sp_events = sp_armature[? "events"];
// create armature
var sk_skel = sk_armature_create(string(argument1));
// transfer bone data
if(is_real(sp_bones)&&ds_exists(sp_bones,ds_type_list)){
	var sp_bone_count = ds_list_size(sp_bones);
	for(var sp_bone_id = 0; sp_bone_id < sp_bone_count; sp_bone_id++){
	    var sp_bone_record = sp_bones[| sp_bone_id];
	    if(is_real(sp_bone_record)&&ds_exists(sp_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sp_bone_record[? "name"]);
	        var sk_bone_len = real(sp_bone_record[? "length"]);
	        var sk_bone_par = sk_armature_find_bone(sk_skel,sp_bone_record[? "parent"]);
			var sk_bone_xpos = real(sp_bone_record[? "x"]);
	        var sk_bone_ypos = -real(sp_bone_record[? "y"]);
	        var sk_bone_xsc = is_real(sp_bone_record[? "scaleX"]) ? sp_bone_record[? "scaleX"] : 1;
	        var sk_bone_ysc = is_real(sp_bone_record[? "scaleY"]) ? sp_bone_record[? "scaleY"] : 1;
	        var sk_bone_xsh = real(sp_bone_record[? "shearX"]);
			var sk_bone_ysh = real(sp_bone_record[? "shearY"]);
			var sk_bone_rot = real(sp_bone_record[? "rotation"]);
	        var sk_bone_inherit_rotation = !is_real(sp_bone_record[? "inheritRotation"])||sp_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sp_bone_record[? "inheritScale"])||sp_bone_record[? "inheritScale"];
			var sk_bone_inheritance = sk_transformMode_normal;
			switch(sp_bone_record[? "transform"]){
				case "onlyTranslation": sk_bone_inheritance = sk_transformMode_noScaleOrRotation; break;
				case "noRotationOrReflection": sk_bone_inheritance = sk_transformMode_noRotation; break;
				case "noScale": case "noScaleOrReflection": sk_bone_inheritance = sk_transformMode_noScale; break;
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name);
			sk_bone_transformMode(sk_bone,sk_bone_inheritance);
			sk_bone_length(sk_bone,sk_bone_len);
			sk_bone_parent(sk_bone,sk_bone_par);
			sk_bone_x(sk_bone,sk_bone_xpos);
			sk_bone_y(sk_bone,sk_bone_ypos);
			sk_bone_xscale(sk_bone,sk_bone_xsc);
			sk_bone_yscale(sk_bone,sk_bone_ysc);
			sk_bone_xshear(sk_bone,sk_bone_xsh);
			sk_bone_yshear(sk_bone,sk_bone_ysh);
			sk_bone_rotation(sk_bone,sk_bone_rot);
			sk_armature_add_bone(sk_skel,sk_bone);
			#endregion
		}
	}
}
// transfer slot data
if(is_real(sp_slots)&&ds_exists(sp_slots,ds_type_list)){
	var sp_slot_count = ds_list_size(sp_slots);
	for(var sp_slot_id = 0; sp_slot_id < sp_slot_count; sp_slot_id++){
	    var sp_slot_record = sp_slots[| sp_slot_id];
	    if(is_real(sp_slot_record)&&ds_exists(sp_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sp_slot_record[? "name"]);
   			var sk_slot_par = sk_armature_find_bone(sk_skel,sp_slot_record[? "bone"]);
			var sk_slot_attachmentName = string(sp_slot_record[? "attachment"]);
			var sk_slot_rgba = is_string(sp_slot_record[? "color"]) ? sp_slot_record[? "color"] : "FFFFFFFF";
	        // create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_defaultDisplay(sk_slot,sk_slot_attachmentName);
			sk_slot_colour(sk_slot,sk_hex_get_colour(sk_slot_rgba,false));
			sk_slot_alpha(sk_slot,sk_hex_get_alpha(sk_slot_rgba,false));
			sk_slot_bone(sk_slot,sk_slot_par);
			sk_armature_add_slot(sk_skel,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sp_skins)&&ds_exists(sp_skins,ds_type_map)){
	var sp_skin_count = ds_map_size(sp_skins);
	var sp_skin_name = ds_map_find_first(sp_skins);
	repeat(sp_skin_count){
		var sp_skin_record = sp_skins[? sp_skin_name];
		if(is_real(sp_skin_record)&&ds_exists(sp_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin = sk_skin_create(sp_skin_name);
			sk_armature_add_skin(sk_skel,sk_skin);
			// compile slot attachment data
			var sp_skin_slots = sp_skin_record;
			// iterate through skin slots and add their display data
			var sp_skin_slot_count = ds_map_size(sp_skin_slots);
			var sp_skin_slot_name = ds_map_find_first(sp_skin_slots);
			repeat(sp_skin_slot_count){
				var sp_skin_slot_record = sp_skin_slots[? sp_skin_slot_name];
				if(is_real(sp_skin_slot_record)&&ds_exists(sp_skin_slot_record,ds_type_map)){
					var sk_skin_slotData = sk_armature_find_slot(sk_skel,sp_skin_slot_name);
					var sp_skin_slot_attachments = sp_skin_slot_record;
					if(sk_struct_exists(sk_skin_slotData,sk_type_slot)){
						// iterate through slot attachments and add create attachments
						var sp_skin_slot_attachment_count = ds_map_size(sp_skin_slot_attachments);
						var sp_skin_slot_attachment_key = ds_map_find_first(sp_skin_slot_attachments);
						repeat(sp_skin_slot_attachment_count){
							var sp_skin_slot_attachment_record = sp_skin_slot_attachments[? sp_skin_slot_attachment_key];
							if(is_real(sp_skin_slot_attachment_record)&&ds_exists(sp_skin_slot_attachment_record,ds_type_map)){
								#region // add attachment to skin
								// attachment name is a combination of its parent slot's name and its attachment key
								var sk_attachment_name = sk_createCompoundKey(sp_skin_slot_name,sp_skin_slot_attachment_key);
								var sk_attachment = noone;
								switch(sp_skin_slot_attachment_record[? "type"]){
									case "mesh": case "linkedmesh": case "boundingbox": case "path": case "clipping": break; // not supported
									case "point":
										// create point attachment
										var sk_attachment_x = real(sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_rotation = real(sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_attachment_create_point(sk_attachment_name);
										sk_attachment_point_set_offsets(
											sk_attachment,
											sk_attachment_x,
											sk_attachment_y,
											sk_attachment_rotation
										);
										sk_armature_add_attachment(sk_skel,sk_attachment);
									break;
									case "region": default:
										// create plane (region) attachment
										var sk_attachment_textureName = is_string(sp_skin_slot_attachment_record[? "name"]) ? sp_skin_slot_attachment_record[? "name"] : string(sp_skin_slot_attachment_key);
										var sk_attachment_x = real(sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_xscale = is_real(sp_skin_slot_attachment_record[? "scaleX"]) ? sp_skin_slot_attachment_record[? "scaleX"] : 1;
										var sk_attachment_yscale = is_real(sp_skin_slot_attachment_record[? "scaleY"]) ? sp_skin_slot_attachment_record[? "scaleY"] : 1;
										var sk_attachment_rotation = real(sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_attachment_create_plane(sk_attachment_name);
										sk_attachment_plane_set_regionKey(sk_attachment,sk_attachment_textureName);
										sk_attachment_plane_set_transform(
											sk_attachment,
											sk_attachment_x,sk_attachment_y,
											sk_attachment_xscale,sk_attachment_yscale,
											0,0,
											sk_attachment_rotation
										);
										sk_armature_add_attachment(sk_skel,sk_attachment);
									break;
								}
								// add attachment to the skin (even if it doesn't exist, because those will be null attachments)
								sk_skin_record_add(
									sk_skin,
									sk_skin_slotData,
									sk_attachment,
									sp_skin_slot_attachment_key
								);
								#endregion
							}
							// goto next attachment
							sp_skin_slot_attachment_key = ds_map_find_next(sp_skin_slot_attachments,sp_skin_slot_attachment_key);
						}
					}
				}
				// goto next slot
				sp_skin_slot_name = ds_map_find_next(sp_skin_slots,sp_skin_slot_name);
			}
			#endregion
		}
		// goto next skin
		sp_skin_name = ds_map_find_next(sp_skins,sp_skin_name);
	}
}
// transfer constraint data
var sp_ik_count = 0;
if(is_real(sp_constraints_IK)&&ds_exists(sp_constraints_IK,ds_type_list)){
	sp_ik_count = ds_list_size(sp_constraints_IK);
}
var sp_transform_count = 0;
if(is_real(sp_constraints_transform)&&ds_exists(sp_constraints_transform,ds_type_list)){
	sp_transform_count = ds_list_size(sp_constraints_transform);
}
var sp_path_count = 0;
if(is_real(sp_constraints_path)&&ds_exists(sp_constraints_path,ds_type_list)){
	sp_path_count = ds_list_size(sp_constraints_path);
}
var sp_constraint_count = sp_ik_count + sp_transform_count + sp_path_count;
for(var sp_constraint_id = 0; sp_constraint_id < sp_constraint_count; sp_constraint_id++){
	// iterate through all constraints and add them by order
	if(sp_ik_count>0){
		for(var sp_ik_id = 0; sp_ik_id < sp_ik_count; sp_ik_id++){
			var sp_ik_record = sp_constraints_IK[| sp_ik_id];
			if(is_real(sp_ik_record)&&ds_exists(sp_ik_record,ds_type_map)){
				if(sp_constraint_id==sp_ik_record[? "order"]){
					var sp_IK_bones = sp_ik_record[? "bones"];
					if(is_real(sp_IK_bones)&&ds_exists(sp_IK_bones,ds_type_list)){
						#region // add IK constraint
						var sk_IK_name = string(sp_ik_record[? "name"]);
				        var sk_IK_chain = ds_list_size(sp_IK_bones)>1;
						var sk_IK_boneTarget = sk_armature_find_bone(sk_skel,sp_ik_record[? "target"]);
						var sk_IK_boneJoint = sk_armature_find_bone(sk_skel,sp_IK_bones[| sk_IK_chain]);
						var sk_IK_positive = (is_real(sp_ik_record[? "bendPositive"])&&(!sp_ik_record[? "bendPositive"])) ? sk_bendDir_positive : sk_bendDir_negative; //  this is because spines +ve y axis is up (not down)
						var sk_IK_weight = is_real(sp_ik_record[? "mix"]) ? sp_ik_record[? "mix"] : 1;
						if(sk_struct_exists(sk_IK_boneTarget,sk_type_bone)&&sk_struct_exists(sk_IK_boneJoint,sk_type_bone)){
							// create new record and set data
							var sk_constraint = sk_constraint_create_ik(sk_IK_name);
							sk_constraint_ik_bendDir(sk_constraint,sk_IK_positive);
							sk_constraint_ik_weight(sk_constraint,sk_IK_weight);
							sk_constraint_ik_chain(sk_constraint,sk_IK_chain);
							sk_constraint_ik_bone_joint(sk_constraint,sk_IK_boneJoint);
							sk_constraint_ik_bone_effector(sk_constraint,sk_IK_boneTarget);
							sk_armature_add_constraint(sk_skel,sk_constraint);
						}
						#endregion
					}
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sp_transform_count>0){
		for(var sp_transform_id = 0; sp_transform_id < sp_transform_count; sp_transform_id++){
			var sp_transform_record = sp_constraints_transform[| sp_transform_id];
			if(is_real(sp_transform_record)&&ds_exists(sp_transform_record,ds_type_map)){
				if(sp_constraint_id==sp_transform_record[? "order"]){
					#region // add transformation constraint
					var sk_transform_name = string(sp_transform_record[? "name"]);
					var sk_transform_boneTarget = sk_armature_find_bone(sk_skel,sp_transform_record[? "target"]);
					var sk_transform_bones = sp_transform_record[? "bones"];
					var sk_transform_x = real(sp_transform_record[? "x"]);
					var sk_transform_y = -real(sp_transform_record[? "y"]);
					var sk_transform_xscale = real(sp_transform_record[? "scaleX"]);
					var sk_transform_yscale = real(sp_transform_record[? "scaleY"]);
					var sk_transform_yshear = real(sp_transform_record[? "shearY"]);
					var sk_transform_rotation = real(sp_transform_record[? "rotation"]);
					var sk_transform_translateMix = is_real(sp_transform_record[? "translateMix"]) ? sp_transform_record[? "translateMix"] : 1;
					var sk_transform_scaleMix = is_real(sp_transform_record[? "scaleMix"]) ? sp_transform_record[? "scaleMix"] : 1;
					var sk_transform_shearMix = is_real(sp_transform_record[? "shearMix"]) ? sp_transform_record[? "shearMix"] : 1;
					var sk_transform_rotateMix = is_real(sp_transform_record[? "rotateMix"]) ? sp_transform_record[? "rotateMix"] : 1;
					var sk_transform_local = real(sp_transform_record[? "local"]);
					var sk_transform_relative = real(sp_transform_record[? "relative"]);
					if(sk_struct_exists(sk_transform_boneTarget,sk_type_bone)){
						// create new record and set data
						var sk_constraint = sk_constraint_create_transform(sk_transform_name);
						sk_constraint_transform_target(sk_constraint,sk_transform_boneTarget);
						sk_constraint_transform_local(sk_constraint,sk_transform_local);
						sk_constraint_transform_relative(sk_constraint,sk_transform_relative);
						sk_constraint_transform_offset_x(sk_constraint,sk_transform_x);
						sk_constraint_transform_offset_y(sk_constraint,sk_transform_y);
						sk_constraint_transform_offset_xscale(sk_constraint,sk_transform_xscale);
						sk_constraint_transform_offset_yscale(sk_constraint,sk_transform_yscale);
						sk_constraint_transform_offset_yshear(sk_constraint,sk_transform_yshear);
						sk_constraint_transform_offset_rotation(sk_constraint,sk_transform_rotation);
						sk_constraint_transform_mix_translate(sk_constraint,sk_transform_translateMix);
						sk_constraint_transform_mix_scale(sk_constraint,sk_transform_scaleMix);
						sk_constraint_transform_mix_shear(sk_constraint,sk_transform_shearMix);
						sk_constraint_transform_mix_rotate(sk_constraint,sk_transform_rotateMix);
						// add child bones
						if(is_real(sk_transform_bones)&&ds_exists(sk_transform_bones,ds_type_list)){
							var sk_transform_bone_count = ds_list_size(sk_transform_bones);
							for(var sk_transform_bone_id = 0; sk_transform_bone_id < sk_transform_bone_count; sk_transform_bone_id++){
								var sk_transform_bone = sk_armature_find_bone(sk_skel,sk_transform_bones[| sk_transform_bone_id]);
								if(sk_struct_exists(sk_transform_bone,sk_type_bone)){
									sk_constraint_transform_children_add(sk_constraint,sk_transform_bone);
								}
							}
						}
						sk_armature_add_constraint(sk_skel,sk_constraint);
					}
					#endregion
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sp_path_count>0){
		for(var sp_path_id = 0; sp_path_id < sp_path_count; sp_path_id++){
			var sp_path_record = sp_constraints_path[| sp_path_id];
			if(is_real(sp_path_record)&&ds_exists(sp_path_record,ds_type_map)){
				if(sp_constraint_id==sp_path_record[? "order"]){
					#region // add path constraint
					// TBA
					#endregion
				}
			}
		}
	}
}
// transfer event data
if(is_real(sp_events)&&ds_exists(sp_events,ds_type_map)){
	var sp_event_count = ds_map_size(sp_events);
	var sp_event_name = ds_map_find_first(sp_events);
	repeat(sp_event_count){
	    var sp_event_record = sp_events[? sp_event_name];
	    if(is_real(sp_event_record)&&ds_exists(sp_event_record,ds_type_map)){
			#region // add event
			var sk_event_string = is_string(sp_event_record[? "string"]) ? sp_event_record[? "string"] : "";
			var sk_event_float = real(sp_event_record[? "float"]);
			var sk_event_int = int64(sp_event_record[? "int"]);
			// create a new attachment and add it to the skin
			var sk_event = sk_event_create(string(sp_event_name));
			sk_event_set_data(
				sk_event,
				noone,
				sk_event_string,
				sk_event_float,
				sk_event_int,
				-1
			);
			sk_armature_add_event(sk_skel,sk_event);
			#endregion
		}
		// goto next event
		sp_event_name = ds_map_find_next(sp_events,sp_event_name);
	}
}
// apply setup
sk_armature_setToDefaultSkin(sk_skel);
sk_armature_updateCache(sk_skel);
sk_armature_setToSetupPose(sk_skel);
sk_armature_updateWorldTransform(sk_skel);
var sk_skel_drawOrder = sk_armature_get_drawOrder(sk_skel);
// transfer animation data
var sp_fps = 60;
if(is_real(sp_animations)&&ds_exists(sp_animations,ds_type_map)){
	var sp_anim_count = ds_map_size(sp_animations);
	var sp_anim_name = ds_map_find_first(sp_animations);
	repeat(sp_anim_count){
	    var sp_anim_record = sp_animations[? sp_anim_name];
	    if(is_real(sp_anim_record)&&ds_exists(sp_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sp_anim_name));
			sk_armature_add_animation(sk_skel,sk_anim);
			var sk_anim_duration = 0;
			// compile timeline data
			var sp_anim_bones = sp_anim_record[? "bones"];
			var sp_anim_slots = sp_anim_record[? "slots"];
			var sp_anim_ik = sp_anim_record[? "ik"];
			var sp_anim_transform = sp_anim_record[? "transform"];
			var sp_anim_events = sp_anim_record[? "events"];
			var sp_anim_drawOrder = sp_anim_record[? "draworder"];
			// iterate through bone data
			if(is_real(sp_anim_bones)&&ds_exists(sp_anim_bones,ds_type_map)){
				var sp_anim_bone_count = ds_map_size(sp_anim_bones);
				var sp_anim_bone_name = ds_map_find_first(sp_anim_bones);
				repeat(sp_anim_bone_count){
				    var sp_anim_bone_record = sp_anim_bones[? sp_anim_bone_name];
				    if(is_real(sp_anim_bone_record)&&ds_exists(sp_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sp_anim_bone_name);
						var sk_anim_timeline_boneData = sk_armature_find_bone(sk_skel,sk_anim_timeline_boneName);
						var sp_anim_bone_translate = sp_anim_bone_record[? "translate"];
						var sp_anim_bone_scale = sp_anim_bone_record[? "scale"];
						var sp_anim_bone_shear = sp_anim_bone_record[? "shear"];
						var sp_anim_bone_rotate = sp_anim_bone_record[? "rotate"];
						#region // compile translate timeline
						if(is_real(sp_anim_bone_translate)&&ds_exists(sp_anim_bone_translate,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_translate);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_translate(sk_anim_timeline_boneName+".TimelineTranslate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_translate[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_translate_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "x"]),
											-real(sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sp_anim_bone_scale)&&ds_exists(sp_anim_bone_scale,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_scale);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_scale(sk_anim_timeline_boneName+".TimelineScale",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_scale[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_scale_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(sp_anim_frame_record[? "x"]) ? sp_anim_frame_record[? "x"] : 1,
											is_real(sp_anim_frame_record[? "y"]) ? sp_anim_frame_record[? "y"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile shear timeline
						if(is_real(sp_anim_bone_shear)&&ds_exists(sp_anim_bone_shear,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_shear);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_shear(sk_anim_timeline_boneName+".TimelineShear",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_shear[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_shear_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "x"]),
											real(sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile rotation timeline
						if(is_real(sp_anim_bone_rotate)&&ds_exists(sp_anim_bone_rotate,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_bone_rotate);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_rotate(sk_anim_timeline_boneName+".TimelineRotate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_bone_rotate[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_rotate_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											real(sp_anim_frame_record[? "angle"]),
											0,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next bone
					sp_anim_bone_name = ds_map_find_next(sp_anim_bones,sp_anim_bone_name);
				}
			}
			// iterate through slot data
			if(is_real(sp_anim_slots)&&ds_exists(sp_anim_slots,ds_type_map)){
				var sp_anim_slot_count = ds_map_size(sp_anim_slots);
				var sp_anim_slot_name = ds_map_find_first(sp_anim_slots);
				repeat(sp_anim_slot_count){
				    var sp_anim_slot_record = sp_anim_slots[? sp_anim_slot_name];
				    if(is_real(sp_anim_slot_record)&&ds_exists(sp_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sp_anim_slot_name);
						var sk_anim_timeline_slotData = sk_armature_find_slot(sk_skel,sk_anim_timeline_slotName);
						var sp_anim_slot_colour = sp_anim_slot_record[? "color"];
						var sp_anim_slot_attachment = sp_anim_slot_record[? "attachment"];
						#region // compile colour timeline
						if(is_real(sp_anim_slot_colour)&&ds_exists(sp_anim_slot_colour,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_slot_colour);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_colour(sk_anim_timeline_slotName+".TimelineColour",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_slot_colour[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// get colour
										var sk_anim_frame_rgba = is_string(sp_anim_frame_record[? "color"]) ? sp_anim_frame_record[? "color"] : "FFFFFFFF";
										// append keyframe data in format [time, colour, alpha, tween]
										sk_timeline_colour_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											sk_hex_get_colour(sk_anim_frame_rgba,false),
											sk_hex_get_alpha(sk_anim_frame_rgba,false),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile display (attachment) timeline
						if(is_real(sp_anim_slot_attachment)&&ds_exists(sp_anim_slot_attachment,ds_type_list)){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_slot_attachment);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_display(sk_anim_timeline_slotName+".TimelineDisplay",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_slot_attachment[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// append keyframe data in format [time, attachmentName]
										sk_timeline_display_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											string(sp_anim_frame_record[? "name"])
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next slot
					sp_anim_slot_name = ds_map_find_next(sp_anim_slots,sp_anim_slot_name);
				}
			}
			// iterate through ik data
			if(is_real(sp_anim_ik)&&ds_exists(sp_anim_ik,ds_type_map)){
				var sp_anim_ik_count = ds_map_size(sp_anim_ik);
				var sp_anim_ik_name = ds_map_find_first(sp_anim_ik);
				repeat(sp_anim_ik_count){
				    var sp_anim_ik_record = sp_anim_ik[? sp_anim_ik_name];
				    if(is_real(sp_anim_ik_record)&&ds_exists(sp_anim_ik_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_ikName = string(sp_anim_ik_name);
						var sk_anim_timeline_ikData = sk_armature_find_constraint_ik(sk_skel,sk_anim_timeline_ikName);
						var sp_anim_ik_frames = sp_anim_ik_record;
						#region // compile IK timeline
						if(true){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_ik_frames);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_ik(sk_anim_timeline_ikName+".TimelineIK",sk_anim_timeline_ikData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_ik_frames[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										sk_timeline_ik_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											sp_anim_frame_record[? "bendPositive"] ? sk_bendDir_negative : sk_bendDir_positive,
											is_real(sp_anim_frame_record[? "mix"]) ? sp_anim_frame_record[? "mix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next ik constraint
					sp_anim_ik_name = ds_map_find_next(sp_anim_ik,sp_anim_ik_name);
				}
			}
			// iterate through transformation data
			if(is_real(sp_anim_transform)&&ds_exists(sp_anim_transform,ds_type_map)){
				var sp_anim_transform_count = ds_map_size(sp_anim_transform);
				var sp_anim_transform_name = ds_map_find_first(sp_anim_transform);
				repeat(sp_anim_transform_count){
				    var sp_anim_transform_record = sp_anim_transform[? sp_anim_transform_name];
				    if(is_real(sp_anim_transform_record)&&ds_exists(sp_anim_transform_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_transformName = string(sp_anim_transform_name);
						var sk_anim_timeline_transformData = sk_armature_find_constraint_transform(sk_skel,sk_anim_timeline_transformName);
						var sp_anim_transform_frames = sp_anim_transform_record;
						#region // compile transformation timeline
						if(true){
	                        var sp_anim_frame_count = ds_list_size(sp_anim_transform_frames);
							if(sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_transform(sk_anim_timeline_transformName+".TimelineTransform",sk_anim_timeline_transformData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_duration = 0;
		                        for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                            var sp_anim_frame_record = sp_anim_transform_frames[| sp_anim_frame_id];
		                            if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_linear;
										var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
										// aproximate bezier curve
										var sp_anim_frame_curve = sp_anim_frame_record[? "curve"];
										if(sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = sk_tweenEasing_none;
										} else if(is_real(sp_anim_frame_curve)&&ds_exists(sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_bezier_aproximateCurve(
												real(sp_anim_frame_curve[| 0]),
												real(sp_anim_frame_curve[| 1]),
												real(sp_anim_frame_curve[| 2]),
												real(sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, translateMix, scaleMix, shearMix, rotateMix, tweenEasing]
										sk_timeline_transform_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(sp_anim_frame_record[? "translateMix"]) ? sp_anim_frame_record[? "translateMix"] : 1,
											is_real(sp_anim_frame_record[? "scaleMix"]) ? sp_anim_frame_record[? "scaleMix"] : 1,
											is_real(sp_anim_frame_record[? "shearMix"]) ? sp_anim_frame_record[? "shearMix"] : 1,
											is_real(sp_anim_frame_record[? "rotateMix"]) ? sp_anim_frame_record[? "rotateMix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next transformation constraint
					sp_anim_transform_name = ds_map_find_next(sp_anim_transform,sp_anim_transform_name);
				}
			}
			// iterate through event data
			var SP_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(sp_anim_record,"|SP_EVENT_TIMELINE_MAP|",SP_EVENT_TIMELINE_MAP); // store it in the spine json temporarily so it can be destroyed easily
			if(is_real(sp_anim_events)&&ds_exists(sp_anim_events,ds_type_list)){
				var sp_anim_event_count = ds_list_size(sp_anim_events);
				if(sp_anim_event_count>0){
					var sk_anim_frame_duration = 0;
		            for(var sp_anim_event_id = 0; sp_anim_event_id < sp_anim_event_count; sp_anim_event_id++){
		                var sp_anim_event_record = sp_anim_events[| sp_anim_event_id];
		                if(is_real(sp_anim_event_record)&&ds_exists(sp_anim_event_record,ds_type_map)){
							#region // compile event timeline
							var sk_anim_frame_time = real(sp_anim_event_record[? "time"])*sp_fps;
							var sk_anim_frame_eventName = sp_anim_event_record[? "name"];
							// get event
							var sk_anim_frame_event = sk_armature_find_event(sk_skel,sk_anim_frame_eventName);
							if(!sk_struct_exists(sk_event,sk_type_event)){
								// event doesn't exist, that's okay, create a new event
								sk_anim_frame_event = sk_event_create(sk_anim_frame_time);
								sk_armature_add_event(sk_skel,sk_anim_frame_event);
							}
							// get timeline
							var sk_anim_frame_timeline = SP_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName];
							if(!sk_struct_exists(sk_anim_frame_timeline,sk_type_timeline_event)){
								// timeline doesn't exist, create it
								sk_anim_frame_timeline = sk_timeline_create_event(sk_anim_frame_eventName+".timelineEvent",sk_anim_frame_event);
								sk_animation_add_timeline(sk_anim,sk_anim_frame_timeline);
								SP_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName] = sk_anim_frame_timeline;
							}
							// get event data
							var sk_anim_frame_int = sp_anim_event_record[? "int"];
							var sk_anim_frame_float = sp_anim_event_record[? "float"];
							var sk_anim_frame_string = sp_anim_event_record[? "string"];
							// append timeline data
							sk_timeline_event_add_frame(
								sk_anim_frame_timeline,
								sk_anim_frame_time,
								noone,
								sk_anim_frame_string,
								sk_anim_frame_float,
								sk_anim_frame_int,
								-1
							);
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
							#endregion
						}
					}
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// iterate through drawOrder data
			if(is_real(sp_anim_drawOrder)&&ds_exists(sp_anim_drawOrder,ds_type_list)){
				var sp_anim_frame_count = ds_list_size(sp_anim_drawOrder);
				if(sp_anim_frame_count>0){
					// add timeline to animation
					var sk_timelineData = sk_timeline_create_order("Armature.TimelineDrawOrder",sk_skel_drawOrder);
					sk_animation_add_timeline(sk_anim,sk_timelineData);
					#region // compile order frames
					var sk_anim_frame_duration = 0;
		            for(var sp_anim_frame_id = 0; sp_anim_frame_id < sp_anim_frame_count; sp_anim_frame_id++){
		                var sp_anim_frame_record = sp_anim_drawOrder[| sp_anim_frame_id];
		                if(is_real(sp_anim_frame_record)&&ds_exists(sp_anim_frame_record,ds_type_map)){
							// add frame
							var sk_anim_frame_time = real(sp_anim_frame_record[? "time"])*sp_fps;
							var sk_order_itemOffsetTuple = sk_timeline_order_add_frame(
								sk_timelineData,
								sk_anim_frame_time
							);
							// find original slot from slots array
							var sp_order_offsets = sp_anim_frame_record[? "offsets"];
							if(is_real(sp_order_offsets)&&ds_exists(sp_order_offsets,ds_type_list)){
								var sp_order_offset_count = ds_list_size(sp_order_offsets);
								for(var sp_order_offset_id = 0; sp_order_offset_id < sp_order_offset_count; sp_order_offset_id++){
									var sp_order_record = sp_order_offsets[| sp_order_offset_id];
									if(is_real(sp_order_record)&&ds_exists(sp_order_record,ds_type_map)){
										var sk_order_slot = sk_armature_find_slot(sk_skel,sp_order_record[? "slot"]);
										var sk_order_shift = real(sp_order_record[? "slot"]);
										if(!sk_struct_exists(sk_order_slot,sk_type_slot)){
											// slot is invalid
											continue;
										}
										// add slot and offset to tuple
										ds_list_add(
											sk_order_itemOffsetTuple,
											sk_order_slot,
											sk_order_shift
										);
									}
								}
							}
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
						}
					}
					#endregion
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// set final duration
			sk_animation_set_duration(sk_anim,max(sk_anim_duration,0));
			#endregion
		}
		// goto next animation
		sp_anim_name = ds_map_find_next(sp_animations,sp_anim_name);
	}
}
// return final structure
ds_map_destroy(sp_skel);
return sk_skel;