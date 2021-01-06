# Usage of Preset Mode

You can create presets (pre-defined song structures) that will handle all the complex stuff for you when performing live. At the tip of your toe, by clicking a button on your BlueBoard, you can walk through a preset, one step at a time (similar to a step sequencer).

## Overview

Presets are written in [Markdown](https://en.wikipedia.org/wiki/Markdown) (using fancy emojis 🎤🎸🎹), and then compiled into a Mozaic script (using a Ruby script).

For example, take a look at [`songs/wish-you-were-here.md`](./songs/wish-you-were-here.md). It is very simple, can be printed and used as an orientation while performing. Using `songs-builder.rb`, the Markdown code will then be compiled to Mozaic code, as seen in [`songs/mozaic/wish-you-were-here`](./songs/mozaic/wish-you-were-here). This code can then be loaded into AUM.

## General Structure

Each preset contains the following:

- A heading on level 1 (e.g. "Pink Floyd - Wish You Were Here")
- A table with general settings for the song (e.g. Beats per minute (BPM), microphone/keyboard/guitar presets to be used, etc.)
- Any number of song parts, each consisting of:
    - A heading on level 2 (e.g. "Intro", or "Verse 2")
    - A list of configuration items, each consisting of:
       - A name (e.g. "1st guitar", or "2nd voice")
       - A nested list of parameters

Parameters are defined using combinations of emojis and associated values (numbers).

Any other content will be ignored.

## Code Demo

```
# Pink Floyd - Wish you were here

Place some more description here if you like...

| Setting | Value |
| --- | --- |
| BPM | 121 |
| 🎸 1 | Wish you were here |
| 🎸 3 | Oasis |
| 🎹 1 | Piano |
| 🎹 2 | Marimba |

## Intro

- 1st guitar (epic riff)
    - 🎤 ❌
    - 🎸 3 ✔️
    - ⏲️ 10
    - ⏺️ 1
- 2nd guitar
    - ⏺️ 1
    - 🎸 1

## Verse 1

- So, so you think you can tell
    - ⏲️ 8
    - ⏺️ 2
    - 🎸 1
```

## Parameter examples

- 🎤 ✔️ - send microphone to GTL
- 🎤 ❌ - do not send microphone to GTL
- 🎹 1 - prepare keyboard preset #1
- 🎸 1 - prepare guitar preset #3
- 🎸 3 ✔️ - prepare guitar preset #3 and send to GTL
- ⏲️ 10 - set clock length to 10
- ⏺️ 1 - record next loop in group #1
- ▶️ 3 - play group #3

## Compile to Mozaic Code

Run `$ ruby songs-builder.rb`. Each preset will result in its own file, stored in [`songs/mozaic`](./songs/mozaic).

## Load Preset in Mozaic

In AUM, load the preset into the first Mozaic slot (replacing `1-bb-handler`).
