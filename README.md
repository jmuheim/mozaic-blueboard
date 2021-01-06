# Group the Loop Performer

Group the Loop Performer (GTL-Performer) is a collection of scripts written in [Mozaic](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653). It controls a bunch of iOS apps that enable a singing guitarist to do advanced looping performances, including:

- Building song structures (verse, chorus, bridge, etc.) using groups of loops
- Deciding what should be recorded to a loop (either guitar, or microphone, or both)
- Applying different FX to guitar (virtual amps), keyboard (instruments presets) and microphone (chorus, vocoder, etc.)
- Creating sets of configurations in advance, so they can be activated by a single button press, one after the other, while performing (like a Step Sequencer)

The goal of GTL-Performer is to enable a single person to become a 1-wo*man-band by letting them perform basic pop/rock/whatever songs in a live situation.

## Setting up all the gear

- [Requirements (Hardware and Apps)](./REQUIREMENTS.md)
- [Configuration](./CONFIGURATION.md)

## See it in action

[![Josh wants to be a band - Wish you were here (Pink Floyd)](./media/wish-you-were-here.jpg)](https://www.youtube.com/watch?v=qK1rAW2jbXA)

## Usage

- [Usage](./USAGE.md)

## Future ideas

- Use MIDI Guitar on voice (e.g. to simulate a violin with vibrato)
- Record MIDI patterns and replay them
- Apply various algorithms on MIDI patterns, e.g. filtering out unwanted notes, detecting chords, quantizing notes, applying a different chord to a recorded pattern, sending bass notes to a different virtual instrument than high notes, etc.
- Apply FX to main out (e.g. chorus, flanger...)

Some day, it should not be necessary at all anymore to look at the iOS device's screen! Everything will be working through foot input (via BlueBoard, in advance to and while performing) and audio feedback (via headphones).
