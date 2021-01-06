# Usage of Preset Mode

You can create presets (pre-defined song structures) that will handle all the complex stuff for you when performing live. At the tip of your toe, by clicking a button on your BlueBoard, you can walk through a preset, one step at a time (similar to a step sequencer).

Presets are written in Markdown (using fancy emojis 🎤🎸🎹), and then compiled into a Mozaic script (using a Ruby script).

For example, take a look at [Pink Floyd - Wish You Were Here](./songs/wish-you-were-here.md). Using `songs-builder.rb`, it will be compiled to [`songs/mozaic/wish-you-were-here`](./songs/mozaic/wish-you-were-here), which can then be loaded into AUM.
