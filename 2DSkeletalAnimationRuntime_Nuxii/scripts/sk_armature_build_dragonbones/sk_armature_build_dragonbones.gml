/// @desc loads an armature file
/// @param json
/// @param armatureNameOrID
var db_armature = noone;
// extract armature data from dragonbones json
var db_skel = json_decode(argument0);
if(ds_exists(db_skel,ds_type_map)){
	var db_armature_found = false;
	var db_armatures = db_skel[? "armature"];
	if(is_real(db_armatures)&&ds_exists(db_armatures,ds_type_list)){
		var db_armature_count = ds_list_size(db_armatures);
        for(var db_armature_id = 0; db_armature_id < db_armature_count; db_armature_id++){
            var db_armature_data = db_armatures[| db_armature_id];
            if(is_real(db_armature_data)&&ds_exists(db_armature_data,ds_type_map)
			&&(db_armature_data[? "type"]=="Armature")&&( (db_armature_data[? "name"]==argument1)||(db_armature_id==argument1) )){
    			// armature found
				db_armature = db_armature_data;
    			db_armature_found = true;
				break;
    		}
        }
	}
	if(!db_armature_found){
		ds_map_destroy(db_skel);
		return noone;
	}
} else {
	return noone;
}
// extract important data
var db_bones = db_armature[? "bone"];
var db_slots = db_armature[? "slot"];
var db_skins = db_armature[? "skin"];
var db_IK = db_armature[? "ik"];
var db_animations = db_armature[? "animation"];
var db_fps = 1; //30/max(real(db_armature[? "frameRate"]),1); // 30 fps baseline /* THIS WAS AN EXPERIMENTAL FEATURE FOR MAPPING THE FRAMERATE OF ANIMATIONS TO GAMESPEED*/
// create armature
var sk_skel = sk_armature_create(string(db_armature[? "name"]));
// transfer bone data
if(is_real(db_bones)&&ds_exists(db_bones,ds_type_list)){
	var db_bone_count = ds_list_size(db_bones);
	for(var db_bone_id = 0; db_bone_id < db_bone_count; db_bone_id++){
	    var db_bone_record = db_bones[| db_bone_id];
	    if(is_real(db_bone_record)&&ds_exists(db_bone_record,ds_type_map)){
	        #region // add bone
			var sk_bone_name = string(db_bone_record[? "name"]);
	        var sk_bone_len = real(db_bone_record[? "length"]);
	        var sk_bone_parent = sk_armature_find_bone(sk_skel,db_bone_record[? "parent"]);
			var sk_bone_x = 0;
	        var sk_bone_y = 0;
	        var sk_bone_xscale = 1;
	        var sk_bone_yscale = 1;
	        var sk_bone_xshear = 0;
			var sk_bone_yshear = 0;
	        var sk_bone_inherit_rotation = !is_real(db_bone_record[? "inheritRotation"])||db_bone_record[? "inheritRotation"];
			var sk_bone_inherit_scale = !is_real(db_bone_record[? "inheritScale"])||db_bone_record[? "inheritScale"];
			var sk_bone_transformMode = (sk_transformMode_rotate*sk_bone_inherit_rotation)
									|	(sk_transformMode_scale*sk_bone_inherit_scale)
									|	sk_transformMode_translate
									|	sk_transformMode_skew;
	        // obtain transformation data
	        var db_bone_transformations = db_bone_record[? "transform"];
	        if(is_real(db_bone_transformations)&&ds_exists(db_bone_transformations,ds_type_map)){
				sk_bone_x = real(db_bone_transformations[? "x"]);
				sk_bone_y = real(db_bone_transformations[? "y"]);
				sk_bone_xscale = is_real(db_bone_transformations[? "scX"]) ? db_bone_transformations[? "scX"] : 1;
				sk_bone_yscale = is_real(db_bone_transformations[? "scY"]) ? db_bone_transformations[? "scY"] : 1;
				sk_bone_xshear = -real(db_bone_transformations[? "skX"]);
				sk_bone_yshear = -real(db_bone_transformations[? "skY"]);
			}
			// create new record and append data
			var sk_bone = sk_bone_create(sk_bone_name);
			sk_bone_set_transformMode(sk_bone,sk_bone_transformMode);
			sk_bone_set_length(sk_bone,sk_bone_len);
			sk_bone_set_parent(sk_bone,sk_bone_parent);
			sk_bone_set_setupPose(
				sk_bone,
				sk_bone_x,sk_bone_y,
				sk_bone_xscale,sk_bone_yscale,
				sk_bone_xshear,sk_bone_yshear,
				0
			);
			sk_armature_add_bone(sk_skel,sk_bone);
			#endregion
	    }
	}
}
// transfer slot data
if(is_real(db_slots)&&ds_exists(db_slots,ds_type_list)){
	var db_slot_count = ds_list_size(db_slots);
	for(var db_slot_id = 0; db_slot_id < db_slot_count; db_slot_id++){
	    var db_slot_record = db_slots[| db_slot_id];
	    if(is_real(db_slot_record)&&ds_exists(db_slot_record,ds_type_map)){
			#region // add slot
	        var sk_slot_name = string(db_slot_record[? "name"]);
   			var sk_slot_parent = sk_armature_find_bone(sk_skel,db_slot_record[? "parent"]);
			var sk_slot_displayIndex = string(real(db_slot_record[? "displayIndex"]));
			var sk_slot_colour = $ffffff;
	        var sk_slot_alpha = 1;
	        // obtain colour data
	        var db_slot_colourData = db_slot_record[? "color"];
	        if(is_real(db_slot_colourData)&&ds_exists(db_slot_colourData,ds_type_map)){
	            var sk_slot_r = db_slot_colourData[? "rM"];
	            var sk_slot_g = db_slot_colourData[? "gM"];
	            var sk_slot_b = db_slot_colourData[? "bM"];
	            var sk_slot_a = db_slot_colourData[? "aM"];
	            sk_slot_colour = make_colour_rgb(
					is_real(sk_slot_r) ? sk_slot_r : 255,
					is_real(sk_slot_g) ? sk_slot_g : 255,
					is_real(sk_slot_b) ? sk_slot_b : 255
				);
	            sk_slot_alpha = is_real(sk_slot_a) ? sk_slot_a : 1;
	        }
			// create new record and set data
			var sk_slot = sk_slot_create(sk_slot_name);
			sk_slot_set_defaultDisplay(sk_slot,sk_slot_displayIndex);
			sk_slot_set_setupPose(
				sk_slot,
				sk_slot_colour,
				sk_slot_alpha,
				sk_slot_parent,
				noone
			);
			sk_armature_add_slot(sk_skel,sk_slot);
			#endregion
	    }
	}
}
// transfer skin and attachment data
if(is_real(db_skins)&&ds_exists(db_skins,ds_type_list)){
	var db_skin_count = ds_list_size(db_skins);
	for(var db_skin_id = 0; db_skin_id < db_skin_count; db_skin_id++){
	    var db_skin_record = db_skins[| db_skin_id];
	    if(is_real(db_skin_record)&&ds_exists(db_skin_record,ds_type_map)){
			#region // add skin
			var sk_skin = sk_skin_create( (is_string(db_skin_record[? "name"])&&(db_skin_record[? "name"]!="")) ? db_skin_record[? "name"] : "default" );
			sk_armature_add_skin(sk_skel,sk_skin);
			// compile slot attachment data
			var db_skin_slots = db_skin_record[? "slot"];
			if(is_real(db_skin_slots)&&ds_exists(db_skin_slots,ds_type_list)){
				// iterate through skin slots and add their display data
				var db_skin_slot_count = ds_list_size(db_skin_slots);
				for(var db_skin_slot_id = 0; db_skin_slot_id < db_skin_slot_count; db_skin_slot_id++){
				    var db_skin_slot_record = db_skin_slots[| db_skin_slot_id];
				    if(is_real(db_skin_slot_record)&&ds_exists(db_skin_slot_record,ds_type_map)){
						var sk_skin_slotData = sk_armature_find_slot(sk_skel,db_skin_slot_record[? "name"]);
						var db_skin_slot_displays = db_skin_slot_record[? "display"];
						if(sk_struct_exists(sk_skin_slotData,sk_type_slot)&&is_real(db_skin_slot_displays)&&ds_exists(db_skin_slot_displays,ds_type_list)){
							// iterate through slot displays and create attachments
							var db_skin_slot_display_count = ds_list_size(db_skin_slot_displays);
							for(var db_skin_slot_display_id = 0; db_skin_slot_display_id < db_skin_slot_display_count; db_skin_slot_display_id++){
							    var db_skin_slot_display_record = db_skin_slot_displays[| db_skin_slot_display_id];
							    if(is_real(db_skin_slot_display_record)&&ds_exists(db_skin_slot_display_record,ds_type_map)){
									#region // add attachment to skin
									// attachment name is a combination of its parent slot and the path of the texture
									var sk_attachment_name = string(sk_struct_get_name(sk_skin_slotData))+"."+string(db_skin_slot_display_record[? "name"]);
									switch(db_skin_slot_display_record[? "type"]){
										case "mesh": case "point": break; // not supported
										case "image": default:
											// create plane attachment
											var sk_attachment_textureName = db_skin_slot_display_record[? "name"];
											var sk_attachment_x = 0;
											var sk_attachment_y = 0;
											var sk_attachment_xscale = 1;
											var sk_attachment_yscale = 1;
											var sk_attachment_xshear = 0;
											var sk_attachment_yshear = 0;
											// compile transformation data
											var db_attachment_transformations = db_skin_slot_display_record[? "transform"];
											if(is_real(db_attachment_transformations)&&ds_exists(db_attachment_transformations,ds_type_map)){
						                        sk_attachment_x = real(db_attachment_transformations[? "x"]);
						                        sk_attachment_y = real(db_attachment_transformations[? "y"]);
						                        sk_attachment_xscale = is_real(db_attachment_transformations[? "scX"]) ? db_attachment_transformations[? "scX"] : 1;
						                        sk_attachment_yscale = is_real(db_attachment_transformations[? "scY"]) ? db_attachment_transformations[? "scY"] : 1;
						                        sk_attachment_xshear = -real(db_attachment_transformations[? "skX"]);
												sk_attachment_yshear = -real(db_attachment_transformations[? "skY"]);
						                    }
											// create a new attachment and add it to the skin
											var sk_attachment = sk_attachment_create_plane(sk_attachment_name);
											sk_attachment_plane_set_regionKey(sk_attachment,sk_attachment_textureName);
											sk_attachment_plane_set_transform(
												sk_attachment,
												sk_attachment_x,sk_attachment_y,
												sk_attachment_xscale,sk_attachment_yscale,
												sk_attachment_xshear,sk_attachment_yshear,
												0
											);
											sk_armature_add_attachment(sk_skel,sk_attachment);
											sk_skin_record_add(
												sk_skin,
												sk_skin_slotData,
												sk_attachment,
												string(db_skin_slot_display_id)
											);
										break;
									}
									#endregion
								}
							}
						}
					}
				}
			}
			#endregion
		}
	}
}
// transfer IKConstraint data 
if(is_real(db_IK)&&ds_exists(db_IK,ds_type_list)){
	var db_IK_count = ds_list_size(db_IK);
	for(var db_IK_id = 0; db_IK_id < db_IK_count; db_IK_id++){
	    var db_IK_record = db_IK[| db_IK_id];
	    if(is_real(db_IK_record)&&ds_exists(db_IK_record,ds_type_map)){
			#region // add IK constraint
			var sk_IK_name = string(db_IK_record[? "name"]);
			var sk_IK_chain = db_IK_record[? "chain"]||false;
	        var sk_IK_boneTarget = sk_armature_find_bone(sk_skel,db_IK_record[? "target"]);
			var sk_IK_boneJoint = sk_armature_find_bone(sk_skel,db_IK_record[? "bone"]);
			var sk_IK_positive = (is_undefined(db_IK_record[? "bendPositive"])||db_IK_record[? "bendPositive"]) ? sk_bendDir_positive : sk_bendDir_negative;
			var sk_IK_weight = is_real(db_IK_record[? "weight"]) ? db_IK_record[? "weight"] : 1;
			if(sk_struct_exists(sk_IK_boneTarget,sk_type_bone)&&sk_struct_exists(sk_IK_boneJoint,sk_type_bone)){
				// create new record and set data
				var sk_constraint = sk_constraint_create_ik(sk_IK_name);
				sk_constraint_ik_set_bones(
					sk_constraint,
					sk_IK_boneJoint,
					sk_IK_boneTarget,
					sk_IK_chain
				);
				sk_constraint_ik_set_setupMix(
					sk_constraint,
					sk_IK_positive,
					sk_IK_weight
				);
				sk_armature_add_constraint(sk_skel,sk_constraint);
			}
			#endregion
	    }
	}
}
// apply setup
sk_armature_updateCache(sk_skel);
sk_armature_setToDefaultSkin(sk_skel);
sk_armature_setToSetupPose(sk_skel);
sk_armature_updateWorldTransform(sk_skel);
var sk_skel_drawOrder = sk_armature_get_drawOrder(sk_skel);
// transfer animation data
if(is_real(db_animations)&&ds_exists(db_animations,ds_type_list)){
	var db_anim_count = ds_list_size(db_animations);
	for(var db_anim_id = 0; db_anim_id < db_anim_count; db_anim_id++){
	    var db_anim_record = db_animations[| db_anim_id];
	    if(is_real(db_anim_record)&&ds_exists(db_anim_record,ds_type_map)){
			#region // add animation
			var sk_anim = sk_animation_create(string(db_anim_record[? "name"]));
			sk_animation_set_duration(sk_anim,max(real(db_anim_record[? "duration"]),0)*db_fps);
			sk_armature_add_animation(sk_skel,sk_anim);
			// compile timeline data
			var db_anim_bones = db_anim_record[? "bone"];
			var db_anim_slots = db_anim_record[? "slot"];
			var db_anim_ik = db_anim_record[? "ik"];
			var db_anim_events = db_anim_record[? "frame"];
			var db_anim_order = db_anim_record[? "zOrder"];
			// iterate through bone data
			if(is_real(db_anim_bones)&&ds_exists(db_anim_bones,ds_type_list)){
	            var db_anim_bone_count = ds_list_size(db_anim_bones);
	            for(var db_anim_bone_id = 0; db_anim_bone_id < db_anim_bone_count; db_anim_bone_id++){
	                var db_anim_bone_record = db_anim_bones[| db_anim_bone_id];
	                if(is_real(db_anim_bone_record)&&ds_exists(db_anim_bone_record,ds_type_map)){
						// add bone timeline data to animation
						var sk_anim_timeline_boneName = string(db_anim_bone_record[? "name"]);
						var sk_anim_timeline_boneData = sk_armature_find_bone(sk_skel,sk_anim_timeline_boneName);
						var db_anim_bone_translate = db_anim_bone_record[? "translateFrame"];
						var db_anim_bone_scale = db_anim_bone_record[? "scaleFrame"];
						var db_anim_bone_rotate = db_anim_bone_record[? "rotateFrame"];
						#region // compile translate timeline
						if(is_real(db_anim_bone_translate)&&ds_exists(db_anim_bone_translate,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_translate);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_translate(sk_anim_timeline_boneName+".TimelineTranslate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_translate[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													real(sk_anim_frame_bezier[| 0]),
													real(sk_anim_frame_bezier[| 1]),
													real(sk_anim_frame_bezier[| 2]),
													real(sk_anim_frame_bezier[| 3])
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_translate_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											real(db_anim_frame_record[? "x"]),
											real(db_anim_frame_record[? "y"]),
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile scale timeline
						if(is_real(db_anim_bone_scale)&&ds_exists(db_anim_bone_scale,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_scale);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_scale(sk_anim_timeline_boneName+".TimelineScale",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_scale[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, dx, dy, tween]
										sk_timeline_scale_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											is_real(db_anim_frame_record[? "x"]) ? db_anim_frame_record[? "x"] : 1,
											is_real(db_anim_frame_record[? "y"]) ? db_anim_frame_record[? "y"] : 1,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile rotate timeline
						if(is_real(db_anim_bone_rotate)&&ds_exists(db_anim_bone_rotate,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_bone_rotate);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_rotate(sk_anim_timeline_boneName+".TimelineRotate",sk_anim_timeline_boneData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_bone_rotate[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, drotation, clockwiseMultiplier, tween]
										sk_timeline_rotate_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											-real(db_anim_frame_record[? "rotate"]),
											-real(db_anim_frame_record[? "clockwise"]), /* this value is multiplied to the next frame to get the amount of extra periods of rotation */
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through slot data
			if(is_real(db_anim_slots)&&ds_exists(db_anim_slots,ds_type_list)){
	            var db_anim_slot_count = ds_list_size(db_anim_slots);
	            for(var db_anim_slot_id = 0; db_anim_slot_id < db_anim_slot_count; db_anim_slot_id++){
	                var db_anim_slot_record = db_anim_slots[| db_anim_slot_id];
	                if(is_real(db_anim_slot_record)&&ds_exists(db_anim_slot_record,ds_type_map)){
						// add slot timeline data to animation
						var sk_anim_timeline_slotName = string(db_anim_slot_record[? "name"]);
						var sk_anim_timeline_slotData = sk_armature_find_slot(sk_skel,sk_anim_timeline_slotName);
						var db_anim_slot_colour = db_anim_slot_record[? "colorFrame"];
						var db_anim_slot_display = db_anim_slot_record[? "displayFrame"];
						#region // compile colour timeline
						if(is_real(db_anim_slot_colour)&&ds_exists(db_anim_slot_colour,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_slot_colour);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_colour(sk_anim_timeline_slotName+".timelineColour",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_slot_colour[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
										// add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
										// get colour
										var sk_anim_frame_colour = $ffffff;
		                                var sk_anim_frame_alpha = 1;
										var db_anim_frame_colourData = db_anim_frame_record[? "color"];
		                                if(is_real(db_anim_frame_colourData)&&ds_exists(db_anim_frame_colourData,ds_type_map)){
		                                    var sk_anim_frame_r = db_anim_frame_colourData[? "rM"];
		                                    var sk_anim_frame_g = db_anim_frame_colourData[? "gM"];
		                                    var sk_anim_frame_b = db_anim_frame_colourData[? "bM"];
		                                    var sk_anim_frame_a = db_anim_frame_colourData[? "aM"];
		                                    sk_anim_frame_colour = make_colour_rgb(
												is_real(sk_anim_frame_r) ? sk_anim_frame_r : 255,
												is_real(sk_anim_frame_g) ? sk_anim_frame_g : 255,
												is_real(sk_anim_frame_b) ? sk_anim_frame_b : 255
											);
		                                    sk_anim_frame_alpha = is_real(sk_anim_frame_a) ? sk_anim_frame_a : 1;
		                                }
		                                // append keyframe data in format [time, colour, alpha, tween]
										sk_timeline_colour_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											sk_anim_frame_colour,
											sk_anim_frame_alpha,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
						#region // compile display timeline
						if(is_real(db_anim_slot_display)&&ds_exists(db_anim_slot_display,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_slot_display);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_display(sk_anim_timeline_slotName+".timelineDisplay",sk_anim_timeline_slotData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_slot_display[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){// add frame
		                                // append keyframe data in format [time, displayIndex]
										sk_timeline_display_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											string(real(db_anim_frame_record[? "value"]))
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			// iterate through ik data
			if(is_real(db_anim_ik)&&ds_exists(db_anim_ik,ds_type_list)){
	            var db_anim_ik_count = ds_list_size(db_anim_ik);
	            for(var db_anim_ik_id = 0; db_anim_ik_id < db_anim_ik_count; db_anim_ik_id++){
	                var db_anim_ik_record = db_anim_ik[| db_anim_ik_id];
	                if(is_real(db_anim_ik_record)&&ds_exists(db_anim_ik_record,ds_type_map)){
						// add ik timeline data to animation
						var sk_anim_timeline_ikName = string(db_anim_ik_record[? "name"]);
						var sk_anim_timeline_ikData = sk_armature_find_constraint_ik(sk_skel,sk_anim_timeline_ikName);
						var db_anim_ik_frames = db_anim_ik_record[? "frame"];
						#region // compile ik timeline
						if(is_real(db_anim_ik_frames)&&ds_exists(db_anim_ik_frames,ds_type_list)){
	                        var db_anim_frame_count = ds_list_size(db_anim_ik_frames);
							if(db_anim_frame_count>0){
								// add timeline to animation
								var sk_timelineData = sk_timeline_create_ik(sk_anim_timeline_ikName+".timelineIK",sk_anim_timeline_ikData);
								sk_animation_add_timeline(sk_anim,sk_timelineData);
								// compile frames
								var sk_anim_frame_time = 0;
		                        for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
		                            var db_anim_frame_record = db_anim_ik_frames[| db_anim_frame_id];
		                            if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){// add frame
		                                // add frame
		                                var sk_anim_frame_tween = sk_tweenEasing_none;
										if(is_real(db_anim_frame_record[? "tweenEasing"])){
											// linear interpolation
											sk_anim_frame_tween = sk_tweenEasing_linear;
										} else {
											var sk_anim_frame_bezier = db_anim_frame_record[? "curve"];
											if(is_real(sk_anim_frame_bezier)&&ds_exists(sk_anim_frame_bezier,ds_type_list)){
												// quadratic interpolation
												sk_anim_frame_tween = sk_bezier_aproximateCurve(
													sk_anim_frame_bezier[| 0],
													sk_anim_frame_bezier[| 1],
													sk_anim_frame_bezier[| 2],
													sk_anim_frame_bezier[| 3]
												);
											}
										}
		                                // append keyframe data in format [time, bendDir, weight, tween]
										sk_timeline_ik_add_frame(
											sk_timelineData,
											sk_anim_frame_time,
											(is_undefined(db_anim_frame_record[? "bendPositive"])||db_anim_frame_record[? "bendPositive"]) ? sk_bendDir_positive : sk_bendDir_negative,
											is_real(db_anim_frame_record[? "weight"]) ? db_anim_frame_record[? "weight"] : 1,
											sk_anim_frame_tween
										);
										// set next duration
										sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
		                            }
		                        }
							}
	                    }
						#endregion
					}
				}
			}
			#region // compile event timelines
			var DB_EVENT_TIMELINE_MAP = ds_map_create(); // create a map to keep track of the timelines for each event
			ds_map_add_map(db_anim_record,"|DB_EVENT_TIMELINE_MAP|",DB_EVENT_TIMELINE_MAP); // store it in the dragonbones json temporarily so it can be destroyed easily
			if(is_real(db_anim_events)&&ds_exists(db_anim_events,ds_type_list)){
	            var db_anim_event_count = ds_list_size(db_anim_events);
				if(db_anim_event_count>0){
					var sk_anim_frame_time = 0; // this is used for events which appear halfway through the timeline
		            for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_event_count; db_anim_frame_id++){
		                var db_anim_frame_record = db_anim_events[| db_anim_frame_id];
		                if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
							// add frame
							var db_anim_frame_events = db_anim_frame_record[? "events"];
							var sk_event_sound = asset_get_index(string(db_anim_frame_record[? "sound"]));
							if(is_real(db_anim_frame_events)&&ds_exists(db_anim_frame_events,ds_type_list)){
								// iterate through events and set their timelines
								var db_event_id;
								var db_event_count = ds_list_size(db_anim_frame_events);
								for(db_event_id = 0; db_event_id < db_event_count; db_event_id++){
									var db_event = db_anim_frame_events[| db_event_id];
									if(is_real(db_event)&&ds_exists(db_event,ds_type_map)){
										// add event
										var sk_event_name = db_event[? "name"];
										//show_message(sk_event_name+string(db_anim_frame_id));
										var sk_event = sk_armature_find_event(sk_skel,sk_event_name);
										if(!sk_struct_exists(sk_event,sk_type_event)){
											// the event doesn't exist yet, so create it
											sk_event = sk_event_create(sk_event_name);
											sk_armature_add_event(sk_skel,sk_event);
										}
										var sk_event_timeline = DB_EVENT_TIMELINE_MAP[? sk_event_name];
										if(!sk_struct_exists(sk_event_timeline,sk_type_timeline_event)){
											// the event timeline doesn't exist yet, so create it
											sk_event_timeline = sk_timeline_create_event(sk_event_name+".timelineEvent",sk_event);
											sk_animation_add_timeline(sk_anim,sk_event_timeline);
											DB_EVENT_TIMELINE_MAP[? sk_event_name] = sk_event_timeline;
										}
										// get data types
										var sk_event_bone = sk_armature_find_bone(sk_skel,db_event[? "bone"]);
										var sk_event_string = undefined;
										var sk_event_float = undefined;
										var sk_event_int = undefined;
										var db_event_strings = db_event[? "strings"];
										if(is_real(db_event_strings)&&ds_exists(db_event_strings,ds_type_list)){
											sk_event_string = string(db_event_strings[| 0]);
										}
										var db_event_floats = db_event[? "floats"];
										if(is_real(db_event_floats)&&ds_exists(db_event_floats,ds_type_list)){
											sk_event_float = real(db_event_floats[| 0]);
										}
										var db_event_ints = db_event[? "ints"];
										if(is_real(db_event_ints)&&ds_exists(db_event_ints,ds_type_list)){
											sk_event_int = int64(db_event_ints[| 0]);
										}
										// append timeline data
										sk_timeline_event_add_frame(
											sk_event_timeline,
											sk_anim_frame_time,
											sk_event_bone,
											sk_event_string,
											sk_event_float,
											sk_event_int,
											sk_event_sound
										);
									}
								}
							}
							// set next duration
							sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
						}
					}
				}
			}
			#endregion
			#region // compile draw order timeline
			if(is_real(db_anim_order)&&ds_exists(db_anim_order,ds_type_map)){
				var db_anim_order_frames = db_anim_order[? "frame"];
				if(is_real(db_anim_order_frames)&&ds_exists(db_anim_order_frames,ds_type_list)){
		            var db_anim_frame_count = ds_list_size(db_anim_order_frames);
					if(db_anim_frame_count>0){
						var sk_anim_frame_time = 0;
						var sk_order_timeline = sk_timeline_create_order("Armature.timelineDrawOrder",sk_skel_drawOrder);
						sk_animation_add_timeline(sk_anim,sk_order_timeline);
			            for(var db_anim_frame_id = 0; db_anim_frame_id < db_anim_frame_count; db_anim_frame_id++){
			                var db_anim_frame_record = db_anim_order_frames[| db_anim_frame_id];
			                if(is_real(db_anim_frame_record)&&ds_exists(db_anim_frame_record,ds_type_map)){
								// add frame
								var sk_order_itemOffsetTuple = sk_timeline_order_add_frame(
									sk_order_timeline,
									sk_anim_frame_time
								);
								// find original slot from slots array
								var db_order_zOrder = db_anim_frame_record[? "zOrder"];
								if(is_real(db_order_zOrder)&&ds_exists(db_order_zOrder,ds_type_list)){
									var db_order_id;
									var db_order_last = ds_list_size(db_order_zOrder);
									for(db_order_id = 0; db_order_id < db_order_last; db_order_id+=2){
										var sk_order_z = real(db_order_zOrder[| db_order_id+0]);
										var sk_order_shift = real(db_order_zOrder[| db_order_id+1]);
										// use z value to locate the desired slot to shift
										var sk_order_slot = sk_skel_drawOrder[| sk_order_z];
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
								// set next duration
								sk_anim_frame_time += real(db_anim_frame_record[? "duration"])*db_fps;
							}
						}
					}
				}
			}
			#endregion
			#endregion
		}
	}
}
// return final structure
ds_map_destroy(db_skel);
return sk_skel;