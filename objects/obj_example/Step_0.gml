/// @desc Update bones.
bone.setup();
bone.localPose.angle = 90 * dsin(current_time * 0.1);
bone.update();
bone2.setup();
bone2.localPose.angle = 90;
bone2.update();