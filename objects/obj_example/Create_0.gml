/// @desc Initialise bones.
bone = new Bone(undefined, 50);
bone.setupPose.xScale = 2;

bone2 = new Bone(bone, 50);
bone2.setupPose.xPos = 50;
bone2.setupPose.xScale = 2;
bone2.setupPose.mode = BoneTransformMode.NO_ROTATION;