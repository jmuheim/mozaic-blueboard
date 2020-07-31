# Mozaic BlueBoard

**This little script enhances the capabilities of an [iRig BlueBoard](https://www.ikmultimedia.com/products/irigblueboard/).**

By default, the BlueBoard only allows to send 4 MIDI signals, by tapping one of its 4 buttons (A, B, C, and D). My script adds the following: it allows to activate unique "spaces" by pressing-and-holding (for roughly 1/4 sec) any of the buttons. Per space, each button sends a unique MIDI signal, which makes `4 spaces * 4 buttons = 16 signals`:

- Space `A` sends `0 to 3`
- Space `B` sends `4 to 7`
- Space `C` sends `8 to 11`
- Space `D` sends `12 to 15`

All signals are sent through channel `15`.

## How to

- You need [AUM](https://apps.apple.com/us/app/aum-audio-mixer/id1055636344) and [Mozaic](https://apps.apple.com/us/app/mozaic-plugin-workshop/id1457962653)
    - Instead of AUM, there might be other similar apps available that can act as the AUv3 host, too
- Turn on your BlueBoard while holding the `B` button (only needed once)
    - You need the most current firmware installed, see [SOLVED: BlueBoard firmware update using Firmware Updater!](https://cgi.ikmultimedia.com/ikforum/viewtopic.php?f=9&t=24780)
- Connect the BlueBoard to AUM in `Menu` > `Settings` > `Central`
- Create a MIDI channel in AUM by pressing the big `+` and selecting `MIDI`
- Hit the `+` on the newly created channel and select `Audio Unit MIDI Processor` > `Mozaic`
- Open the MIDI routing by pressing the snake-like arrow button, then make sure that the BlueBoard sends to Mozaic, and Mozaic sends to the BlueBoard
- Click on the Mozaic icon to show its GUI
- Click `Code`, then replace the default code by copying and pasting the content of [script](https://raw.githubusercontent.com/jmuheim/mozaic-blueboard/master/script)
- Press `Upload`: if everything went right, all buttons of the BlueBoard should be illuminated now!
    - In Mozaic's `Log` you can see messages when interacting with the BlueBoard (play around by tapping and pressing-and-holding its buttons)
- Now create an audio channel in AUM by pressing the big `+` and selecting `AUDIO`
- Then hit the `+` on the top of the newly created channel and select `Inter-App Audio` > `Group the Loop (Main Output)` (or any other app that you want to control using MIDI)
- Open the MIDI routing again (snake-like arrow), then make sure that Mozaic also sends to `Group the Loop` (you may need to scroll to see all options)
- Open `Group the Loop` by pressing its icon
- In its settings, select `MIDI`, make sure that `Virtual MIDI` is set as `MIDI Input Port`
    - Now tap on some buttons on the BlueBoard to make sure that the MIDI signals arrive as expected (they should be displayed in the `LOG`)
- You can now start to add MIDI bindings, yay!

## Additional info

For more info see related posts on the [Audiobus forums](https://forum.audiob.us/):

- [Mozaic: How to detect a "long tap" (0.5secs) on my BlueBoard](https://forum.audiob.us/discussion/39866/mozaic-how-to-detect-a-long-tap-0-5secs-on-my-blueboard)
- [How can I tweak my MIDI foot controller so it responds to combined, double clicks, sequences, etc.?](https://forum.audiob.us/discussion/39720/how-can-i-tweak-my-midi-foot-controller-so-it-responds-to-combined-double-clicks-sequences-etc)
- [Is there a MIDI app that allows to send several controls by the press of only one switch?](https://forum.audiob.us/discussion/39721/is-there-a-midi-app-that-allows-to-send-several-controls-by-the-press-of-only-one-switch#latest)

## Alternatives

- The [Midifire](https://apps.apple.com/us/app/midifire/id906600872) **Blue Velvet** script adds advanced input gestures like double/triple taps and combinations of taps to the BlueBoard, see [Midifire Blue velvet adds up to 24 midi notes controls to Blueboard](https://forum.audiob.us/discussion/29902/midifire-blue-velvet-adds-up-to-24-midi-notes-controls-to-blueboard/p1). While this seems intriguing, it is too difficult for me and my tap dancing skills.
