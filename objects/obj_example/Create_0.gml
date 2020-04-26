/// @desc Initialise bones.
bone = new Bone(undefined, 100);
bone.setupPose.xScale = 2;

bone2 = new Bone(bone, 100);
bone2.setupPose.xPos = 100;
bone2.setupPose.mode &= ~BoneTransformMode.SCALE;