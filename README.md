# Group the Loop Performer

Group the Loop Performer (GTL-Performer) is a collection of scripts written in [Mozaic](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653). It controls a bunch of iOS apps that enable a singing guitarist to do advanced looping performances, including:

- Building song structures (verse, chorus, bridge, etc.) using groups of loops
- Deciding what should be recorded to a loop (either guitar, or microphone, or both)
- Applying different FX to guitar (virtual amps) and microphone (chorus, vocoder, etc.)
- Creating sets of configurations in advance, so they can be activated by a single button press, one after the other, while performing (like a Step Sequencer)

The goal of GTL-Performer is to enable a single person to become a 1-wo*man-band by letting them perform basic pop/rock/whatever songs in a live situation.

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
- Cables to connect the guitar and microphone to the audio interface (probably 1/4 TRS and XLR ones)
- An [Apple lightning to USB camera adapter](https://www.amazon.com/Apple-Lightning-USB3-Camera-Adapter/dp/B01F7KJDIM/) to connect the audio interface to the iOS device
    - The audio interface will probably need an additional power source, so:
         - Either make sure the adapter has an additional Lightning input that allows to plug it into a power bank (or a power outlet)
        - Or get an audio interface with its own battery power, like the [Zoom U-44](https://zoomcorp.com/en/jp/audio-interface/audio-interfaces/u-24/)
- A [stereo breakout cable](https://www.amazon.com/Hosa-YMM-261-Stereo-Breakout-Cable/dp/B000068O5H/)
    - Possibly a [1/4 to 1/8 adapter](https://www.amazon.com/6-35mm-Female-Adapter-Converter-Headphones/dp/B07SM4ZM33/) to connect the breakout cable to the external sound interface's output
- Headphones, connected to the left mono output channel of the breakout cable (for receiving audio feedback from GTL-Performer, which is only meant for the artist, like clicks of the metronome, or instruction and confirmation messages, see below)
- External speakers, connected to the right mono output channel of the breakout cable (for the performance's audio, which is meant for the audience)
- An [iRig BlueBoard](https://www.ikmultimedia.com/products/irigblueboard/)
    - Be sure to have its [firmware updated](https://cgi.ikmultimedia.com/ikforum/viewtopic.php?f=9&t=24780)

**Note:** To be fully mobile (i.e. when performing on the streets), I'm using an [ExplorAudio H-Clamp](https://exploraudio.com/categories/giltrap-signature-h-clamp/24/) to attach the microphone to my guitar. I also attach my iPhone to it using some additional elements that I was generously sponsored by ExplorAudio (thank you so much, Robert). However, any [microphone stand](https://www.amazon.co.uk/Tiger-Music-MCA7-BK-Professional-Microphone/dp/B002GODR1W) and [iPhone/iPad holder](https://www.aliexpress.com/item/32717839677.html) will do.

## Needed Apps

- [Group the Loop (GTL)](https://apps.apple.com/us/app/group-the-loop/id1029416579) (14$)
    - Provides the foundation for recording and playing loops (and groups of loops, so song structures can be built)
- [Audio Mixer (AUM)](https://apps.apple.com/us/app/aum-audio-mixer/id1055636344) (20$)
    - Hosts the input channels and virtual instruments, routes them as needed to GTL, runs the Mozaic scripts, etc.
- [Mozaic Plugin Workshop (Mozaic)](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653) (8$)
    - Runs the present collection of scripts that manage the interplay between all involved software (using MIDI signals)
- [Chameleon AUv3 Sampler Plugin (Chameleon)](https://apps.apple.com/us/app/chameleon-auv3-sampler-plugin/id1456474953) (6$)
    - Or a similar sampler plugin that lets you create your own patches (with a specific audio file per MIDI note)
- [RoughRider3 (RR)](https://apps.apple.com/us/app/roughrider3/id1496058931?ls=1) (free)
    - A simple compressor which enhances the main output (just discard it if you don't want it)

## Installation and Configuration

### Mozaic scripts

- Start AUM
- Create a new MIDI channel and call it "Mozaic"
- Go through each script file (from top to bottom) and apply their specific installation instructions.

### Audio routing

#### Main out

- In AUM, create a new audio channel and call it "Main out"
- As source ("+" button on the very top), select "Mix Bus" -> "Bus P"
- As destination (speaker button on the very bottom), select "Hardware Output" -> "Speaker"

#### Receive from GTL

- In AUM, create a new audio channel and call it "Receive from GTL"
- As source, select "Inter-App Audio" -> "Group the Loop (Main Output)"
- As destination, select "Mix Bus" -> "Bus P"

#### Microphone

- In AUM, create a new audio channel and call it "Microphone"
- As source, select "Hardware Input" -> "Audio interface channel X" (where your microphone is plugged in)
- As insert/effect ("+" button in the middle between source and destination), select "Bus Send" -> "Bus A"
- As destination, select "Mix Bus" -> "Bus P"

#### Guitar

- In AUM, create a new audio channel and call it "Guitar"
- As source, select "Hardware Input" -> "Audio interface channel Y" (where your guitar is plugged in)
- As insert/effect, select "Audio Unit Extension" -> "Tonebridge"
- As another insert/effect (drag the slots up to show a "+1" button, then press it), select "Bus Send" -> "Bus A"
- As destination, select "Mix Bus" -> "Bus P"

To switch between Tonebridge's FX, it needs some presets that can be toggled using MIDI. First of all, create some presets:

- Click the "Tonebridge" button
- Click its "Search" button and locate a favourite preset (e.g. "Wish You Were Here")
- Open the "Presets" menu (top left of the window) and click "+"
- Enter a name (typically similar to the preset's name) and click "Save in AUM"

Repeat this process until you have 6 presets. Then close the window by pressing the "X" button.

Now each preset needs to listen to some MIDI signal so it can be toggled on/off:

- Click the channel's name ("Guitar")
- Click the "MIDI settings" button (top left of the menu)
- Click "Mozaic @M1:9" (AumProxy)
- Go back (click "Guitar" button)
- Select "Tonebridge Parameters" -> "Preset Load"
- For the first preset, assign MIDI note (not CC!) 0 to channel 4
- For the second, assign MIDI note 1, etc.

### Keyboard

TODO

// - Keyboard (Audio)
//     - Input: Audio Unit Extension -> Chameleon
//     - Insert: Bus Send -> Bus A
//     - Output: Mix Bus -> Bus P

### Send to GTL

- In AUM, create a new audio channel and call it "Sed to GTL"
- As source, select "Mix Bus" -> "Bus A"
- As destination, select "IAA / Audiobus Output" -> "IAA / AB Output 1" (GTL will listen there)

### Save and close

That's all! Wasn't that easy?

Just save the session as "GTL Wizard" in AUM so you can recall it easily again!

## Usage

### Connecting the gear

- Active flight mode on your iOS device (possibly even restart it first)
- Connect the audio interface to the iOS device via the Lightning USB adapter (make sure it has enough power by attaching it to a power source, if needed)
    - Connect the guitar to its left input
    - Connect the microphone to its right input
    - Connect the audio breakout cable to its output
        - Connect the headphones to its left output
        - Connect the speakers to its right output
- Start AUM app and load the session "GTL Wizard"
- Turn on the BlueBoard while pressing the B button (the Bluetooth LED should start flashing)
    - In AUM, click Menu -> Settings -> Bluetooth MIDI Central -> Connect to iRig BlueBoard Bluetooth (the Bluetooth LED will glow continuously now)
- Start MG and load preset "MIDI output"

## Future ideas

- Use MIDI Guitar on voice (e.g. to simulate a violin with vibrato)
- Record MIDI patterns and replay them
- Apply various algorithms on MIDI patterns, e.g. filtering out unwanted notes, detecting chords, quantizing notes, applying a different chord to a recorded pattern, sending bass notes to a different virtual instrument than high notes, etc.
- Apply FX to main out (e.g. chorus, flanger...)

Some day, it should not be necessary at all anymore to look at the iOS device's screen! Everything will be working through foot input (via BlueBoard, in advance to and while performing) and audio feedback (via headphones).
