# Nuxii's GameMaker 2D Skeletal Animation Runtime

This is a work in progress improvement of my previous skeletal animation system, which can be found [here](https://github.com/NuxiiGit/GML2DSkeletalAnimation/releases/tag/0.1.0).

The runtime will feature support for [Spine](http://esotericsoftware.com/) and [DragonBones](http://dragonbones.com). I may think about re-supporting [Spriter](https://brashmonkey.com/) in the future, but with it's successor on the horizon I may consider supporting that instead.

This is a project for GameMaker Studio 2, and contains a diverse range of useful scripts for importing and manipulating skeletal animation structures at runtime. You are able to make use of the decentralised nature of the runtime to create and manage your own armature data without the use of external software.

## Features

- Add, edit, and remove skeleton data at runtime.
- Build your own skeletons dynamically without requiring external software.
- Support for various bone transforms:
  - Translation,
  - Scale,
  - Shear,
  - Rotation.
- Supports both skew and non-skew scaling, plus a selection of other transform modes.
- Support for various bone constraints:
  - Inverse Kinematics (IK) constraints,
  - Transform constraints,
  - Physics constraints.
- Support for nested constraints by adding all updatables to a single iterable list.
- IK constraints support both uniform and non-uniform scales of it's parent bone.
- Includes physics constraints for fancy jiggle-bone movements which fluidly interact with the movements of your animations.
- Supports skins, and the ability to stack multiple skins at once.
- Supports various attachment types:
  - Plane (region) attachments,
  - Point attachments.
- Event support.
- Reparent slots at runtime to give you more control over the display of your armature.
- Includes various timelines used to animate your skeleton data:
  - Bone timelines:
    - Translate timeline,
    - Scale timeline,
    - Shear timeline,
    - Rotate timeline.
  - Slot timelines:
    - Colour timeline,
    - Attachment timeline,
    - Parent timeline.
  - Constraint timelines:
    - IK timeline,
	- Transformation timeline.
  - Event timeline,
  - Draw order timeline.
- Interpolate between animations instantly, linearly, or quadratically.
- Blend multiple animations using a variety of "Mix Modes":
  - `SK_MIX_ADD`: Add the animation pose to the current pose.
  - `SK_MIX_BLEND`: Blend between the current pose and the new pose.
  - `SK_MIX_OVERWRITE`: Overwrite the setup pose.
- Animate your skeleton using an animation state controller, which handles the blending of multiple animations for you.
- Bake your final poses to a vertex buffer, allowing you to render multiple armatures with a single draw call.

## Installation Instructions

This will be added when an example project is complete.

## Limitations

All sprites must be located on the same texture atlas in order to be attached. This means that multi-page atlases are not possible.