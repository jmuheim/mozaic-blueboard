# Group the Loop Wizard

Group the Loop Wizard (GTL-Wiz) is a collection of scripts written in [Mozaic](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653). It controls a bunch of iOS apps that enable a singing guitarist to do advanced looping performances, including:

- Building song structures (verse, chorus, bridge, etc.) using groups of loops
- Deciding what should be recorded to a loop (either guitar, or microphone, or both)
- Applying different FX to guitar (virtual amps) and microphone (chorus, vocoder, etc.)
- Using the guitar as MIDI input to trigger virtual instruments
- Creating sets of configurations in advance, so they can be activated by a single button press, one after the other, while performing (like a Step Sequencer)

The goal of GTL-Wiz is to enable a single person to become a 1-person-band by letting them perform traditional pop songs in a live situation.

## Needed Hardware

- An iOS device
    - I'm using a [2016 iPhone SE](https://en.wikipedia.org/wiki/IPhone_SE_%281st_generation%29)
    - If you're using a more recent device that has USB-C (not Lightning), you need to adapt the following gear list accordingly
- A guitar that can be plugged into an audio interface
    - I have an acoustic one (steel strings), but an electric one might be suited even better
- A microphone
    - I have a generic dynamic one that is similar to the [Shure SM57](https://www.shure.com/en-US/products/microphones/sm58)
- An external audio interface which allows to connect both a guitar and a microphone
    - I'm using an ESI UGM96 as it is ultra portable, but there are [many options available](https://forum.audiob.us/discussion/39270/what-is-the-smallest-2-channel-guitar-mic-usb-audio-interface/p1)
- Some cables to connect the guitar and microphone to the audio interface (probably 1/4 TRS and XLR ones)
- An [Apple lightning to USB camera adapter](https://www.amazon.com/Apple-Lightning-USB3-Camera-Adapter/dp/B01F7KJDIM/) to connect the audio interface to the iOS device
- A [stereo breakout cable](https://www.amazon.com/Hosa-YMM-261-Stereo-Breakout-Cable/dp/B000068O5H/)
    - Possibly a [1/4 to 1/8 adapter](https://www.amazon.com/6-35mm-Female-Adapter-Converter-Headphones/dp/B07SM4ZM33/) to connect the breakout cable to the external sound interface's output
- Headphones, connected to left mono output channel of the breakout cable (for receiving audio feedback from GTL-Wiz, ie. clicks of the metronome, instruction and confirmation messages, etc.)
- External speakers, connected to right mono output channel of the breakout cable (for the performance's audio)
- An [iRig BlueBoard](https://www.ikmultimedia.com/products/irigblueboard/)

## Needed Apps

Required:

- [Group the Loop](https://apps.apple.com/us/app/group-the-loop/id1029416579) (14$)
    - Provides the foundation for recording and playing loops (and groups of loops, so song structures can be built)
- [Audio Mixer [AUM]](https://apps.apple.com/us/app/aum-audio-mixer/id1055636344) (20$)
    - Hosts the input channels and virtual instruments, routes them as needed to GTL, receives the played back loops, and runs the Mozaic scripts
- [Mozaic Plugin Workshop](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653) (8$)
    - Runs the present collection of scripts that manage the interplay between all involved software (using MIDI signals)

Optional:

- [Chameleon AUv3 Sampler Plugin](https://apps.apple.com/us/app/chameleon-auv3-sampler-plugin/id1456474953) (6$)
    - Or a similar sampler plugin that lets you create your own patches (with a specific audio file per MIDI note)
- [MIDI Guitar](https://apps.apple.com/us/app/midi-guitar/id523095780) (~30$)
    - Or any other MIDI input device, ie. a different [guitar to MIDI solution](https://forum.audiob.us/discussion/40935/pros-and-cons-of-different-guitar-to-midi-solutions-ios-midi-guitar-2-fishman-triple-play/p1?new=1) or an external MIDI keyboard like the [KORG nanoKEY](https://www.korg.com/us/products/computergear/nanokey2/)
- [RoughRider3](https://apps.apple.com/us/app/roughrider3/id1496058931?ls=1) (free)
    - A simple compressor which enhances the main output (just discard it if you don't want it)

## Configuration

Go through each script file and apply their specific instructions.

## Future ideas

- Use MIDI Guitar on voice (e.g. to simulate a violin with vibrato)
- Record MIDI patterns and replay them
- Apply various algorithms on MIDI patterns, e.g. filtering out unwanted notes, detecting chords, quantizing notes, applying a different chord to a recorded pattern, sending bass notes to a different virtual instrument than high notes, etc.
- Apply FX to main out (e.g. chorus, flanger...)
