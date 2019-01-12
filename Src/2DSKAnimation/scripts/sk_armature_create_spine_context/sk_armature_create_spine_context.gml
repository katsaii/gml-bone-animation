/// @desc loads an armature file
/// @param json
var sk_sp_armature = noone;
// extract armature data from spriter json
var sk_sp_arm = json_decode(argument0);
if(sk_sp_arm!=-1){
	sk_sp_armature = sk_sp_arm;
} else {
	return noone;
}
// extract important data
var sk_sp_meta = sk_sp_armature[? "skeleton"];
var sk_sp_bones = sk_sp_armature[? "bones"];
var sk_sp_slots = sk_sp_armature[? "slots"];
var sk_sp_skins = sk_sp_armature[? "skins"];
var sk_sp_constraints_IK = sk_sp_armature[? "ik"];
var sk_sp_constraints_transform = sk_sp_armature[? "transform"];
var sk_sp_constraints_path = sk_sp_armature[? "path"]; // not used
var sk_sp_animations = sk_sp_armature[? "animations"];
var sk_sp_events = sk_sp_armature[? "events"];
// create armature
var sk_arm = sk_armature_create();
// create containers
var sk_bones = ds_list_create();
var sk_constraints = ds_list_create();
var sk_slots = ds_list_create();
var sk_animations = ds_list_create();
var sk_skins = ds_list_create();
var sk_attachments = ds_list_create();
var sk_events = ds_list_create();
// transfer bone data
if(is_real(sk_sp_bones)&&ds_exists(sk_sp_bones,ds_type_list)){
	var sk_sp_bone_count = ds_list_size(sk_sp_bones);
	for(var sk_sp_bone_id = 0; sk_sp_bone_id < sk_sp_bone_count; sk_sp_bone_id++){
	    var sk_sp_bone_record = sk_sp_bones[| sk_sp_bone_id];
	    if(is_real(sk_sp_bone_record)&&ds_exists(sk_sp_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(sk_sp_bone_record[? "name"]);
	        var sk_bone_len = real(sk_sp_bone_record[? "length"]);
	        var sk_bone_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_bone_record[? "parent"])];
			var sk_bone_xpos = real(sk_sp_bone_record[? "x"]);
	        var sk_bone_ypos = -real(sk_sp_bone_record[? "y"]);
	        var sk_bone_xsc = is_real(sk_sp_bone_record[? "scaleX"]) ? sk_sp_bone_record[? "scaleX"] : 1;
	        var sk_bone_ysc = is_real(sk_sp_bone_record[? "scaleY"]) ? sk_sp_bone_record[? "scaleY"] : 1;
	        var sk_bone_xsh = real(sk_sp_bone_record[? "shearX"]);
			var sk_bone_ysh = real(sk_sp_bone_record[? "shearY"]);
			var sk_bone_rot = real(sk_sp_bone_record[? "rotation"]);
	        var sk_bone_inherit_rotation = !is_real(sk_sp_bone_record[? "inheritRotation"])||sk_sp_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(sk_sp_bone_record[? "inheritScale"])||sk_sp_bone_record[? "inheritScale"];
			var sk_bone_inheritance = SK_TRANSFORM_MODE_NORMAL;
			switch(sk_sp_bone_record[? "transform"]){
				case "onlyTranslation": sk_bone_inheritance = SK_TRANSFORM_MODE_NOROTATIONORSCALE; break;
				case "noRotationOrReflection": sk_bone_inheritance = SK_TRANSFORM_MODE_NOROTATION; break;
				case "noScale": case "noScaleOrReflection": sk_bone_inheritance = SK_TRANSFORM_MODE_NOSCALE; break;
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name,sk_bone_par,sk_bone_len);
			sk_bone_set_pose(
				sk_bone,
				sk_bone_xpos,sk_bone_ypos,
				sk_bone_xsc,sk_bone_ysc,
				sk_bone_xsh,sk_bone_ysh,
				sk_bone_rot,
				sk_bone_inheritance
			);
			ds_list_add(sk_bones,sk_bone);
			#endregion
		}
	}
}
// transfer slot data
if(is_real(sk_sp_slots)&&ds_exists(sk_sp_slots,ds_type_list)){
	var sk_sp_slot_count = ds_list_size(sk_sp_slots);
	for(var sk_sp_slot_id = 0; sk_sp_slot_id < sk_sp_slot_count; sk_sp_slot_id++){
	    var sk_sp_slot_record = sk_sp_slots[| sk_sp_slot_id];
	    if(is_real(sk_sp_slot_record)&&ds_exists(sk_sp_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(sk_sp_slot_record[? "name"]);
   			var sk_slot_par = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_slot_record[? "bone"])];
			var sk_slot_attachmentName = string(sk_sp_slot_record[? "attachment"]);
			var sk_slot_rgba = is_string(sk_sp_slot_record[? "color"]) ? sk_sp_slot_record[? "color"] : "FFFFFFFF";
	        // create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_set_pose(
				sk_slot,
				__sk_hex_to_colour(sk_slot_rgba,false),
				__sk_hex_to_alpha(sk_slot_rgba,false),
				sk_slot_par,
				sk_slot_attachmentName
			);
			ds_list_add(sk_slots,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(sk_sp_skins)&&ds_exists(sk_sp_skins,ds_type_map)){
	var sk_sp_skin_count = ds_map_size(sk_sp_skins);
	var sk_sp_skin_name = ds_map_find_first(sk_sp_skins);
	repeat(sk_sp_skin_count){
		var sk_sp_skin_record = sk_sp_skins[? sk_sp_skin_name];
		if(is_real(sk_sp_skin_record)&&ds_exists(sk_sp_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin = sk_skin_create(sk_sp_skin_name);
			ds_list_add(sk_skins,sk_skin);
			// compile slot attachment data
			var sk_sp_skin_slots = sk_sp_skin_record;
			// iterate through skin slots and add their display data
			var sk_sp_skin_slot_count = ds_map_size(sk_sp_skin_slots);
			var sk_sp_skin_slot_name = ds_map_find_first(sk_sp_skin_slots);
			repeat(sk_sp_skin_slot_count){
				var sk_sp_skin_slot_record = sk_sp_skin_slots[? sk_sp_skin_slot_name];
				if(is_real(sk_sp_skin_slot_record)&&ds_exists(sk_sp_skin_slot_record,ds_type_map)){
					var sk_skin_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_sp_skin_slot_name)];
					var sk_sp_skin_slot_attachments = sk_sp_skin_slot_record;
					if(sk_slot_exists(sk_skin_slotData)){
						// iterate through slot attachments and add create attachments
						var sk_sp_skin_slot_attachment_count = ds_map_size(sk_sp_skin_slot_attachments);
						var sk_sp_skin_slot_attachment_key = ds_map_find_first(sk_sp_skin_slot_attachments);
						repeat(sk_sp_skin_slot_attachment_count){
							var sk_sp_skin_slot_attachment_record = sk_sp_skin_slot_attachments[? sk_sp_skin_slot_attachment_key];
							if(is_real(sk_sp_skin_slot_attachment_record)&&ds_exists(sk_sp_skin_slot_attachment_record,ds_type_map)){
								#region // add attachment to skin
								// attachment name is a combination of its parent slot's name and its attachment key
								var sk_attachment_name = string(sk_sp_skin_slot_name)+"."+string(sk_sp_skin_slot_attachment_key);
								var sk_attachment = noone;
								switch(sk_sp_skin_slot_attachment_record[? "type"]){
									case "mesh": case "linkedmesh": case "boundingbox": case "path": case "clipping": break; // not supported
									case "point":
										// create point attachment
										var sk_attachment_x = real(sk_sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sk_sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_rotation = real(sk_sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_point_attachment_create(sk_attachment_name,sk_attachment_x,sk_attachment_y,sk_attachment_rotation);
									break;
									case "region": default:
										// create plane (region) attachment
										var sk_attachment_textureName = is_string(sk_sp_skin_slot_attachment_record[? "name"]) ? sk_sp_skin_slot_attachment_record[? "name"] : string(sk_sp_skin_slot_attachment_key);
										var sk_attachment_x = real(sk_sp_skin_slot_attachment_record[? "x"]);
										var sk_attachment_y = -real(sk_sp_skin_slot_attachment_record[? "y"]);
										var sk_attachment_xscale = is_real(sk_sp_skin_slot_attachment_record[? "scaleX"]) ? sk_sp_skin_slot_attachment_record[? "scaleX"] : 1;
										var sk_attachment_yscale = is_real(sk_sp_skin_slot_attachment_record[? "scaleY"]) ? sk_sp_skin_slot_attachment_record[? "scaleY"] : 1;
										var sk_attachment_rotation = real(sk_sp_skin_slot_attachment_record[? "rotation"]);
										// create a new attachment and add it to the skin
										sk_attachment = sk_plane_attachment_create(sk_attachment_name);
										sk_plane_attachment_set_regionKey(sk_attachment,sk_attachment_textureName);
										sk_plane_attachment_set_matrix(
											sk_attachment,
											sk_attachment_x,sk_attachment_y,
											sk_attachment_xscale,sk_attachment_yscale,
											0,0,sk_attachment_rotation
										);
									break;
								}
								ds_list_add(sk_attachments,sk_attachment);
								// add attachment to the skin (even if it doesn't exist, because those will be null attachments)
								sk_skin_record_add(
									sk_skin,
									sk_skin_slotData,
									sk_attachment,
									sk_sp_skin_slot_attachment_key
								);
								#endregion
							}
							// goto next attachment
							sk_sp_skin_slot_attachment_key = ds_map_find_next(sk_sp_skin_slot_attachments,sk_sp_skin_slot_attachment_key);
						}
					}
				}
				// goto next slot
				sk_sp_skin_slot_name = ds_map_find_next(sk_sp_skin_slots,sk_sp_skin_slot_name);
			}
			#endregion
		}
		// goto next skin
		sk_sp_skin_name = ds_map_find_next(sk_sp_skins,sk_sp_skin_name);
	}
}
// transfer constraint data
var sk_sp_ik_count = 0;
if(is_real(sk_sp_constraints_IK)&&ds_exists(sk_sp_constraints_IK,ds_type_list)){
	sk_sp_ik_count = ds_list_size(sk_sp_constraints_IK);
}
var sk_sp_transform_count = 0;
if(is_real(sk_sp_constraints_transform)&&ds_exists(sk_sp_constraints_transform,ds_type_list)){
	sk_sp_transform_count = ds_list_size(sk_sp_constraints_transform);
}
var sk_sp_path_count = 0;
if(is_real(sk_sp_constraints_path)&&ds_exists(sk_sp_constraints_path,ds_type_list)){
	sk_sp_path_count = ds_list_size(sk_sp_constraints_path);
}
var sk_sp_constraint_count = sk_sp_ik_count + sk_sp_transform_count + sk_sp_path_count;
for(var sk_sp_constraint_id = 0; sk_sp_constraint_id < sk_sp_constraint_count; sk_sp_constraint_id++){
	// iterate through all constraints and add them by order
	if(sk_sp_ik_count>0){
		for(var sk_sp_ik_id = 0; sk_sp_ik_id < sk_sp_ik_count; sk_sp_ik_id++){
			var sk_sp_ik_record = sk_sp_constraints_IK[| sk_sp_ik_id];
			if(is_real(sk_sp_ik_record)&&ds_exists(sk_sp_ik_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_ik_record[? "order"]){
					var sk_sp_IK_bones = sk_sp_ik_record[? "bones"];
					if(is_real(sk_sp_IK_bones)&&ds_exists(sk_sp_IK_bones,ds_type_list)){
						#region // add IK constraint
						var sk_IK_name = string(sk_sp_ik_record[? "name"]);
				        var sk_IK_chain = ds_list_size(sk_sp_IK_bones)>1;
						var sk_IK_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_ik_record[? "target"])];
						var sk_IK_boneJoint = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_IK_bones[| sk_IK_chain ? 1 : 0])];
						var sk_IK_positive = (is_real(sk_sp_ik_record[? "bendPositive"])&&(!sk_sp_ik_record[? "bendPositive"])) ? SK_BEND_POSITIVE : SK_BEND_NEGATIVE; //  this is because spines +ve y axis is up (not down)
						var sk_IK_weight = is_real(sk_sp_ik_record[? "mix"]) ? sk_sp_ik_record[? "mix"] : 1;
						// create new record and set data
						var sk_constraint = sk_ik_constraint_create(sk_IK_name,sk_IK_boneJoint,sk_IK_boneTarget,sk_IK_chain);
						sk_ik_constraint_set_pose(sk_constraint,sk_IK_positive,sk_IK_weight);
						ds_list_add(sk_constraints,sk_constraint);
						#endregion
					}
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sk_sp_transform_count>0){
		for(var sk_sp_transform_id = 0; sk_sp_transform_id < sk_sp_transform_count; sk_sp_transform_id++){
			var sk_sp_transform_record = sk_sp_constraints_transform[| sk_sp_transform_id];
			if(is_real(sk_sp_transform_record)&&ds_exists(sk_sp_transform_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_transform_record[? "order"]){
					#region // add transformation constraint
					var sk_transform_name = string(sk_sp_transform_record[? "name"]);
					var sk_transform_boneTarget = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_sp_transform_record[? "target"])];
					var sk_transform_bones = sk_sp_transform_record[? "bones"];
					var sk_transform_x = real(sk_sp_transform_record[? "x"]);
					var sk_transform_y = -real(sk_sp_transform_record[? "y"]);
					var sk_transform_xscale = real(sk_sp_transform_record[? "scaleX"]);
					var sk_transform_yscale = real(sk_sp_transform_record[? "scaleY"]);
					var sk_transform_yshear = real(sk_sp_transform_record[? "shearY"]);
					var sk_transform_rotation = real(sk_sp_transform_record[? "rotation"]);
					var sk_transform_translateMix = is_real(sk_sp_transform_record[? "translateMix"]) ? sk_sp_transform_record[? "translateMix"] : 1;
					var sk_transform_scaleMix = is_real(sk_sp_transform_record[? "scaleMix"]) ? sk_sp_transform_record[? "scaleMix"] : 1;
					var sk_transform_shearMix = is_real(sk_sp_transform_record[? "shearMix"]) ? sk_sp_transform_record[? "shearMix"] : 1;
					var sk_transform_rotateMix = is_real(sk_sp_transform_record[? "rotateMix"]) ? sk_sp_transform_record[? "rotateMix"] : 1;
					var sk_transform_local = real(sk_sp_transform_record[? "local"]);
					var sk_transform_relative = real(sk_sp_transform_record[? "relative"]);
					// create new record and set data
					var sk_constraint = sk_transformation_constraint_create(sk_transform_name,sk_transform_boneTarget);
					sk_transformation_constraint_set_state(sk_constraint,sk_transform_local,sk_transform_relative);
					sk_transformation_constraint_set_offsets(
						sk_constraint,
						sk_transform_x,sk_transform_y,
						sk_transform_xscale,sk_transform_yscale,
						sk_transform_yshear,sk_transform_rotation
					);
					sk_transformation_constraint_set_pose(
						sk_constraint,
						sk_transform_translateMix,
						sk_transform_scaleMix,
						sk_transform_shearMix,
						sk_transform_rotateMix
					);
					// add child bones
					var sk_children = ds_list_create();
					if(is_real(sk_transform_bones)&&ds_exists(sk_transform_bones,ds_type_list)){
						var sk_transform_bone_count = ds_list_size(sk_transform_bones);
						for(var sk_transform_bone_id = 0; sk_transform_bone_id < sk_transform_bone_count; sk_transform_bone_id++){
							var sk_transform_bone = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_transform_bones[| sk_transform_bone_id])];
							ds_list_add(sk_children,sk_transform_bone);
						}
					}
					sk_transformation_constraint_set_children(sk_constraint,sk_children);
					ds_list_destroy(sk_children);
					ds_list_add(sk_constraints,sk_constraint);
					#endregion
					break; // break out of the loop since the current constraint was found
				}
			}
		}
	}
	if(sk_sp_path_count>0){
		for(var sk_sp_path_id = 0; sk_sp_path_id < sk_sp_path_count; sk_sp_path_id++){
			var sk_sp_path_record = sk_sp_constraints_path[| sk_sp_path_id];
			if(is_real(sk_sp_path_record)&&ds_exists(sk_sp_path_record,ds_type_map)){
				if(sk_sp_constraint_id==sk_sp_path_record[? "order"]){
					#region // add path constraint
					// TBA
					#endregion
				}
			}
		}
	}
}
// transfer event data
if(is_real(sk_sp_events)&&ds_exists(sk_sp_events,ds_type_map)){
	var sk_sp_event_count = ds_map_size(sk_sp_events);
	var sk_sp_event_name = ds_map_find_first(sk_sp_events);
	repeat(sk_sp_event_count){
	    var sk_sp_event_record = sk_sp_events[? sk_sp_event_name];
	    if(is_real(sk_sp_event_record)&&ds_exists(sk_sp_event_record,ds_type_map)){
			#region // add event
			var sk_event_string = is_string(sk_sp_event_record[? "string"]) ? sk_sp_event_record[? "string"] : "";
			var sk_event_float = real(sk_sp_event_record[? "float"]);
			var sk_event_int = int64(sk_sp_event_record[? "int"]);
			// create a new event and add it to the armature
			var sk_event = sk_event_create(string(sk_sp_event_name),noone,sk_event_string,sk_event_float,sk_event_int,-1);
			ds_list_add(sk_events,sk_event);
			#endregion
		}
		// goto next event
		sk_sp_event_name = ds_map_find_next(sk_sp_events,sk_sp_event_name);
	}
}
// transfer animation data
var sk_sp_fps = 60;
if(is_real(sk_sp_animations)&&ds_exists(sk_sp_animations,ds_type_map)){
	var sk_sp_anim_count = ds_map_size(sk_sp_animations);
	var sk_sp_anim_name = ds_map_find_first(sk_sp_animations);
	repeat(sk_sp_anim_count){
	    var sk_sp_anim_record = sk_sp_animations[? sk_sp_anim_name];
	    if(is_real(sk_sp_anim_record)&&ds_exists(sk_sp_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(sk_sp_anim_name));
			ds_list_add(sk_animations,sk_anim);
			var sk_anim_duration = 0;
			var sk_anim_timelines = ds_list_create();
			// compile timeline data
			var sk_sp_anim_bones = sk_sp_anim_record[? "bones"];
			var sk_sp_anim_slots = sk_sp_anim_record[? "slots"];
			var sk_sp_anim_ik = sk_sp_anim_record[? "ik"];
			var sk_sp_anim_transform = sk_sp_anim_record[? "transform"];
			var sk_sp_anim_events = sk_sp_anim_record[? "events"];
			var sk_sp_anim_drawOrder = sk_sp_anim_record[? "draworder"];
			// iterate through bone data
			if(is_real(sk_sp_anim_bones)&&ds_exists(sk_sp_anim_bones,ds_type_map)){
				var sk_sp_anim_bone_count = ds_map_size(sk_sp_anim_bones);
				var sk_sp_anim_bone_name = ds_map_find_first(sk_sp_anim_bones);
				repeat(sk_sp_anim_bone_count){
				    var sk_sp_anim_bone_record = sk_sp_anim_bones[? sk_sp_anim_bone_name];
				    if(is_real(sk_sp_anim_bone_record)&&ds_exists(sk_sp_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(sk_sp_anim_bone_name);
						var sk_anim_timeline_boneData = sk_bones[| ds_list_find_index_sk_bone(sk_bones,sk_anim_timeline_boneName)];
						var sk_sp_anim_bone_translate = sk_sp_anim_bone_record[? "translate"];
						var sk_sp_anim_bone_scale = sk_sp_anim_bone_record[? "scale"];
						var sk_sp_anim_bone_shear = sk_sp_anim_bone_record[? "shear"];
						var sk_sp_anim_bone_rotate = sk_sp_anim_bone_record[? "rotate"];
						#region // compile translate timeline
						if(is_real(sk_sp_anim_bone_translate)&&ds_exists(sk_sp_anim_bone_translate,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_translate);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_translate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_translate[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											real(sk_sp_anim_frame_record[? "x"]),
											-real(sk_sp_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_translate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(sk_sp_anim_bone_scale)&&ds_exists(sk_sp_anim_bone_scale,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_scale);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_scale_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_scale[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "x"],
											sk_sp_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_scale_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile shear timeline
						if(is_real(sk_sp_anim_bone_shear)&&ds_exists(sk_sp_anim_bone_shear,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_shear);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_shear_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_shear[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "x"],
											sk_sp_anim_frame_record[? "y"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_shear_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile rotation timeline
						if(is_real(sk_sp_anim_bone_rotate)&&ds_exists(sk_sp_anim_bone_rotate,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_bone_rotate);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_rotate_timeline_create(sk_anim_timeline_boneData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_bone_rotate[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
		                                // append keyframe data in format [time, angle, cycles, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "angle"],
											0,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_rotate_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next bone
					sk_sp_anim_bone_name = ds_map_find_next(sk_sp_anim_bones,sk_sp_anim_bone_name);
				}
			}
			// iterate through slot data
			if(is_real(sk_sp_anim_slots)&&ds_exists(sk_sp_anim_slots,ds_type_map)){
				var sk_sp_anim_slot_count = ds_map_size(sk_sp_anim_slots);
				var sk_sp_anim_slot_name = ds_map_find_first(sk_sp_anim_slots);
				repeat(sk_sp_anim_slot_count){
				    var sk_sp_anim_slot_record = sk_sp_anim_slots[? sk_sp_anim_slot_name];
				    if(is_real(sk_sp_anim_slot_record)&&ds_exists(sk_sp_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(sk_sp_anim_slot_name);
						var sk_anim_timeline_slotData = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_anim_timeline_slotName)];
						var sk_sp_anim_slot_colour = sk_sp_anim_slot_record[? "color"];
						var sk_sp_anim_slot_attachment = sk_sp_anim_slot_record[? "attachment"];
						#region // compile colour timeline
						if(is_real(sk_sp_anim_slot_colour)&&ds_exists(sk_sp_anim_slot_colour,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_slot_colour);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_colour_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_slot_colour[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// get colour
										var sk_anim_frame_rgba = is_string(sk_sp_anim_frame_record[? "color"]) ? sk_sp_anim_frame_record[? "color"] : "FFFFFFFF";
										// append keyframe data in format [time, colour, alpha, tween]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											__sk_hex_to_colour(sk_anim_frame_rgba,false),
											__sk_hex_to_alpha(sk_anim_frame_rgba,false),
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_colour_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
						#region // compile attachment timeline
						if(is_real(sk_sp_anim_slot_attachment)&&ds_exists(sk_sp_anim_slot_attachment,ds_type_list)){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_slot_attachment);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_attachment_timeline_create(sk_anim_timeline_slotData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_timeline_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_slot_attachment[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// append keyframe data in format [time, attachmentName]
										ds_list_add(
											sk_timeline_frames,
											sk_anim_frame_time,
											string(sk_sp_anim_frame_record[? "name"])
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_attachment_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next slot
					sk_sp_anim_slot_name = ds_map_find_next(sk_sp_anim_slots,sk_sp_anim_slot_name);
				}
			}
			// iterate through ik data
			if(is_real(sk_sp_anim_ik)&&ds_exists(sk_sp_anim_ik,ds_type_map)){
				var sk_sp_anim_ik_count = ds_map_size(sk_sp_anim_ik);
				var sk_sp_anim_ik_name = ds_map_find_first(sk_sp_anim_ik);
				repeat(sk_sp_anim_ik_count){
				    var sk_sp_anim_ik_record = sk_sp_anim_ik[? sk_sp_anim_ik_name];
				    if(is_real(sk_sp_anim_ik_record)&&ds_exists(sk_sp_anim_ik_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_ikName = string(sk_sp_anim_ik_name);
						var sk_anim_timeline_ikData = sk_constraints[| ds_list_find_index_sk_ik_constraint(sk_constraints,sk_anim_timeline_ikName)];
						var sk_sp_anim_ik_frames = sk_sp_anim_ik_record;
						#region // compile IK timeline
						if(true){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_ik_frames);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_ik_timeline_create(sk_anim_timeline_ikData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_anim_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_ik_frames[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										ds_list_add(
											sk_anim_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "bendPositive"] ? SK_BEND_NEGATIVE : SK_BEND_POSITIVE,
											is_real(sk_sp_anim_frame_record[? "mix"]) ? sk_sp_anim_frame_record[? "mix"] : 1,
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_ik_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next ik constraint
					sk_sp_anim_ik_name = ds_map_find_next(sk_sp_anim_ik,sk_sp_anim_ik_name);
				}
			}
			// iterate through transformation data
			if(is_real(sk_sp_anim_transform)&&ds_exists(sk_sp_anim_transform,ds_type_map)){
				var sk_sp_anim_transform_count = ds_map_size(sk_sp_anim_transform);
				var sk_sp_anim_transform_name = ds_map_find_first(sk_sp_anim_transform);
				repeat(sk_sp_anim_transform_count){
				    var sk_sp_anim_transform_record = sk_sp_anim_transform[? sk_sp_anim_transform_name];
				    if(is_real(sk_sp_anim_transform_record)&&ds_exists(sk_sp_anim_transform_record,ds_type_list)){
						// add constraint timeline data to animation
						var sk_anim_timeline_transformName = string(sk_sp_anim_transform_name);
						var sk_anim_timeline_transformData = sk_constraints[| ds_list_find_index_sk_transformation_constraint(sk_constraints,sk_anim_timeline_transformName)];
						var sk_sp_anim_transform_frames = sk_sp_anim_transform_record;
						#region // compile transform timeline
						if(true){
	                        var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_transform_frames);
							if(sk_sp_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_transformation_timeline_create(sk_anim_timeline_transformData);
								ds_list_add(sk_anim_timelines,sk_timelineData);
								// compile frames
								var sk_anim_frames = ds_list_create();
								var sk_anim_frame_duration = 0;
		                        for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                            var sk_sp_anim_frame_record = sk_sp_anim_transform_frames[| sk_sp_anim_frame_id];
		                            if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = SK_EASE_LINEAR;
										var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
										// aproximate bezier curve
										var sk_sp_anim_frame_curve = sk_sp_anim_frame_record[? "curve"];
										if(sk_sp_anim_frame_curve=="stepped"){
											sk_anim_frame_tween = SK_EASE_NONE;
										} else if(is_real(sk_sp_anim_frame_curve)&&ds_exists(sk_sp_anim_frame_curve,ds_type_list)){
											// quadratic interpolation
											sk_anim_frame_tween = sk_ease_function_from_bezier(
												real(sk_sp_anim_frame_curve[| 0]),
												real(sk_sp_anim_frame_curve[| 1]),
												real(sk_sp_anim_frame_curve[| 2]),
												real(sk_sp_anim_frame_curve[| 3])
											);
										}
										// append keyframe data in format [time, bendDir, weight, tweenEasing]
										ds_list_add(
											sk_anim_frames,
											sk_anim_frame_time,
											sk_sp_anim_frame_record[? "translateMix"],
											sk_sp_anim_frame_record[? "scaleMix"],
											sk_sp_anim_frame_record[? "shearMix"],
											sk_sp_anim_frame_record[? "rotateMix"],
											sk_anim_frame_tween
										);
										// set last time for next frame
										sk_anim_frame_duration = sk_anim_frame_time;
		                            }
		                        }
								sk_transformation_timeline_set_keyframes(sk_timelineData,sk_timeline_frames);
								ds_list_destroy(sk_timeline_frames);
								// update the max duration of the animation
								sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
							}
	                    }
						#endregion
					}
					// goto next transformation constraint
					sk_sp_anim_transform_name = ds_map_find_next(sk_sp_anim_transform,sk_sp_anim_transform_name);
				}
			}
			// iterate through event data
			var sk_sp_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(sk_sp_anim_record,"|sk_sp_EVENT_TIMELINE_MAP|",sk_sp_EVENT_TIMELINE_MAP); // store it in the spine json temporarily so it can be destroyed easily
			if(is_real(sk_sp_anim_events)&&ds_exists(sk_sp_anim_events,ds_type_list)){
				var sk_sp_anim_event_count = ds_list_size(sk_sp_anim_events);
				if(sk_sp_anim_event_count>0){
					var sk_anim_frame_duration = 0;
		            for(var sk_sp_anim_event_id = 0; sk_sp_anim_event_id < sk_sp_anim_event_count; sk_sp_anim_event_id++){
		                var sk_sp_anim_event_record = sk_sp_anim_events[| sk_sp_anim_event_id];
		                if(is_real(sk_sp_anim_event_record)&&ds_exists(sk_sp_anim_event_record,ds_type_map)){
							#region // compile event timeline
							var sk_anim_frame_time = real(sk_sp_anim_event_record[? "time"])*sk_sp_fps;
							var sk_anim_frame_eventName = sk_sp_anim_event_record[? "name"];
							// get event
							var sk_anim_frame_event = sk_events[| ds_list_find_index_sk_event(sk_events,sk_anim_frame_eventName)];
							if(sk_event_exists(sk_anim_frame_event)){
								// get timeline
								var sk_anim_frame_timeline = sk_sp_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName];
								if(!sk_event_timeline_exists(sk_anim_frame_timeline)){
									// timeline doesn't exist, create it
									sk_anim_frame_timeline = sk_event_timeline_create(sk_anim_frame_event);
									ds_list_add(sk_anim_timelines,sk_anim_frame_timeline);
									sk_sp_EVENT_TIMELINE_MAP[? sk_anim_frame_eventName] = sk_anim_frame_timeline;
								}
								// get event data
								var sk_anim_frame_int = sk_sp_anim_event_record[? "int"];
								var sk_anim_frame_float = sk_sp_anim_event_record[? "float"];
								var sk_anim_frame_string = sk_sp_anim_event_record[? "string"];
								// append timeline data in format [time, bone, string, real, int, sound]
								var sk_anim_frames = ds_list_create();
								sk_event_timeline_get_keyframes(sk_anim_frame_timeline,sk_anim_frames);
								ds_list_add(
									sk_anim_frames,
									sk_anim_frame_time,
									undefined,
									sk_anim_frame_string,
									sk_anim_frame_float,
									sk_anim_frame_int,
									-1
								);
								sk_event_timeline_set_keyframes(sk_anim_frame_timeline,sk_anim_frames);
								ds_list_destroy(sk_anim_frames);
							}
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
			if(is_real(sk_sp_anim_drawOrder)&&ds_exists(sk_sp_anim_drawOrder,ds_type_list)){
				var sk_sp_anim_frame_count = ds_list_size(sk_sp_anim_drawOrder);
				if(sk_sp_anim_frame_count>0){
					// add timeline to animation
					var sk_timelineData = sk_drawOrder_timeline_create(sk_arm);
					ds_list_add(sk_anim_timelines,sk_timelineData);
					#region // compile order frames
					var sk_anim_frames = ds_list_create();
					var sk_anim_frame_duration = 0;
		            for(var sk_sp_anim_frame_id = 0; sk_sp_anim_frame_id < sk_sp_anim_frame_count; sk_sp_anim_frame_id++){
		                var sk_sp_anim_frame_record = sk_sp_anim_drawOrder[| sk_sp_anim_frame_id];
		                if(is_real(sk_sp_anim_frame_record)&&ds_exists(sk_sp_anim_frame_record,ds_type_map)){
							// add frame
							var sk_anim_frame_time = real(sk_sp_anim_frame_record[? "time"])*sk_sp_fps;
							var sk_order_itemOffsetTuple = ds_list_create();
							// find original slot from slots array
							var sk_sp_order_offsets = sk_sp_anim_frame_record[? "offsets"];
							if(is_real(sk_sp_order_offsets)&&ds_exists(sk_sp_order_offsets,ds_type_list)){
								var sk_sp_order_offset_count = ds_list_size(sk_sp_order_offsets);
								for(var sk_sp_order_offset_id = 0; sk_sp_order_offset_id < sk_sp_order_offset_count; sk_sp_order_offset_id++){
									var sk_sp_order_record = sk_sp_order_offsets[| sk_sp_order_offset_id];
									if(is_real(sk_sp_order_record)&&ds_exists(sk_sp_order_record,ds_type_map)){
										var sk_order_slot = sk_slots[| ds_list_find_index_sk_slot(sk_slots,sk_sp_order_record[? "slot"])];
										if(!sk_slot_exists(sk_order_slot)) then continue;
										// add slot and offset to tuple
										ds_list_add(
											sk_order_itemOffsetTuple,
											sk_order_slot,
											real(sk_sp_order_record[? "slot"])
										);
									}
								}
							}
							// append timeline data in the format [time, tuple]
							ds_list_add(
								sk_anim_frames,
								sk_anim_frame_time,
								sk_order_itemOffsetTuple
							);
							ds_list_mark_as_list(sk_anim_frames,ds_list_size(sk_anim_frames)-1);
							// set last time for next frame
							sk_anim_frame_duration = sk_anim_frame_time;
						}
					}
					#endregion
					sk_drawOrder_timeline_set_keyframes(sk_timelineData,sk_anim_frames);
					ds_list_destroy(sk_anim_frames);
					// update the max duration of the animation
					sk_anim_duration = max(sk_anim_duration,sk_anim_frame_duration);
				}
			}
			// set final duration
			sk_animation_set_duration(sk_anim,sk_anim_duration,false);
			// set timelines
			sk_animation_set_timelines(sk_anim,sk_anim_timelines);
			ds_list_destroy(sk_anim_timelines);
			#endregion
		}
		// goto next animation
		sk_sp_anim_name = ds_map_find_next(sk_sp_animations,sk_sp_anim_name);
	}
}
// destroy spine json
ds_map_destroy(sk_sp_arm);
// set armature containers
sk_armature_set_bones(sk_arm,sk_bones);
sk_armature_set_constraints(sk_arm,sk_constraints);
sk_armature_set_slots(sk_arm,sk_slots);
sk_armature_set_animations(sk_arm,sk_animations);
sk_armature_set_skins(sk_arm,sk_skins);
sk_armature_set_attachments(sk_arm,sk_attachments);
sk_armature_set_events(sk_arm,sk_events);
sk_armature_update_cache(sk_arm);
sk_armature_set_default_skin(sk_arm,"default");
sk_armature_set_skin(sk_arm);
sk_armature_pose_setup(sk_arm);
sk_armature_pose_update(sk_arm);
// destroy containers
ds_list_destroy(sk_bones);
ds_list_destroy(sk_constraints);
ds_list_destroy(sk_slots);
ds_list_destroy(sk_animations);
ds_list_destroy(sk_skins);
ds_list_destroy(sk_attachments);
ds_list_destroy(sk_events);
// return armature
return sk_arm;