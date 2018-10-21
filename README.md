# GML2DSkeletalAnimation

This project for Gamemaker Studio 2 contains a diverse range of useful scripts for importing and manipulating skeletal animation sprites at runtime.

## Downloads

Download the project file ([.zip](https://github.com/NuxiiGit/GML2DSkeletalAnimation/archive/master.zip)), or clone the project through git using:

```
git clone git@github.com:NuxiiGit/GML2DSkeletalAnimation.git
```

### Supported Software

> [Spine](http://esotericsoftware.com/)
> [DragonBones](http://dragonbones.com)
> [Spriter](https://brashmonkey.com/)

Alternatively, due to the decentralised nature of the runtime, you can use the features I offer without the use of external software by dynamically creating bones and other skeleton data at runtime without the need for an armature or texture atlas.

### Features

- Entirely script-oriented; no overhead from objects.
- Add, edit, and remove data procedurally without the need for a skeletal animation software.
- Manipulate bone, slot, and other skeleton data freely at runtime.
- Supports non-uniform scale and skew transforms for bones and region attachments.
- Support for transformation and IK constraints.
- IK constraint support for non-uniform parent scales.
- Skin support, and the ability to apply these skins simultaneously to mix and match your armatures.
- Use a skins remap stack to override a skins default attachment with another ([similar in design to Spriters character maps](https://www.youtube.com/watch?v=NufHCAHrEdw))
- Event support.
- Support for point attachments.
- Draw order and display timelines for slots for frame-by-frame animation.
- Change a slots parent dynamically using the new "parent" timeline.
- Interpolate between animations instantly, linearly, or quadratically.
- Mix multiple animations using a selection of existing "Mix Modes".
- Supports nested constraints by adding all updatable data to a single iterable list.
- Bake your final armatures directly to vertex buffers to render multiple sprites from a single armature.
- Debug Scripts for bones, armatures, and atlas' with a range of debug arguments to help you figure out what's wrong in this cruel, cruel world...
- Contains an abundance of helper scripts and "properties" for ease of use.
- Includes physics constraints for fancy jiggle bone movements that fluidly interact with your animations and movement at runtime.
- Includes hierarchy constraints for quick and easy dynamic reparenting of bones.

### Missing or Unsupported Features (items from this list may be implemented if desired)
- Mesh attachments.
- Clipping attachments.
- Bounding box attachments.
- Path attachments.
- Path constraints.
- Tint black. (two colour slots)
- Bezier curves.

### Limitations
- All sprites must be located on the same texture atlas in order to be attached.