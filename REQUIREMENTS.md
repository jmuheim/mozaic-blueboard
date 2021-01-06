# Requirements

There's quite a bunch of hardware and apps needed for the complete setup.

## Needed Hardware

- An iOS device
    - I'm using a [2016 iPhone SE](https://en.wikipedia.org/wiki/IPhone_SE_%281st_generation%29)
    - If you're using a more recent device that has USB-C (not Lightning), you need to adapt the following gear list accordingly
- A microphone
    - I have a generic dynamic one that is similar to the [Shure SM57](https://www.shure.com/en-US/products/microphones/sm58)
- A MIDI keyboard (optional)
    - I have a [Korg nanoKEY2](https://www.korg.com/us/products/computergear/nanokey2/)
- A guitar that can be plugged into an audio interface
    - I have an acoustic one (steel strings), but an electric one might be suited even better
- An external audio interface which allows to connect both a guitar and a microphone
    - I'm using an ESI UGM96 as it is ultra portable, but there are [many options available](https://forum.audiob.us/discussion/39270/what-is-the-smallest-2-channel-guitar-mic-usb-audio-interface/p1)
- Cables to connect the guitar and microphone to the audio interface (probably 1/4 TRS and XLR ones)
- An [Apple lightning to USB camera adapter](https://www.amazon.com/Apple-Lightning-USB3-Camera-Adapter/dp/B01F7KJDIM/) to connect the audio interface to the iOS device
    - The audio interface will probably need an additional power source, so:
        - Either make sure the adapter has an additional Lightning input that allows to plug it into a power bank (or a power outlet)
        - Or get an audio interface with its own battery power, like the [Zoom U-44](https://zoomcorp.com/en/jp/audio-interface/audio-interfaces/u-24/)
- A small [USB hub](https://www.aliexpress.com/item/4001003589071.html) to allow both the audio interface and the MIDI keyboard to be connected
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
- [MIDI Guitar 2](https://apps.apple.com/us/app/midi-guitar/id523095780) (30$)
    - Transforms my guitar into a MIDI controller (I'm also playing around with a [Fishman Triple Play Connect](https://www.fishman.com/tripleplay/), hoping to improve accuracy of audio-to-MIDI translation)
- [Chameleon AUv3 Sampler Plugin (Chameleon)](https://apps.apple.com/us/app/chameleon-auv3-sampler-plugin/id1456474953) (6$)
    - Or a similar sampler plugin that lets you create your own patches (with a specific audio file per MIDI note)
- [RoughRider3 (RR)](https://apps.apple.com/us/app/roughrider3/id1496058931?ls=1) (free)
    - A simple compressor which enhances the main output (just discard it if you don't want it)
