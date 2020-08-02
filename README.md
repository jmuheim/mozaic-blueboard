# Mozaic BlueBoard

**This little script enhances the capabilities of an [iRig BlueBoard](https://www.ikmultimedia.com/products/irigblueboard/).**

By default, the BlueBoard only allows to send 4 MIDI signals, by tapping one of its 4 buttons `A` (`60`), `B` (`62`), `C` (`64`), and `D` (`65`). The [enhancer](https://raw.githubusercontent.com/jmuheim/mozaic-blueboard/master/enhancer) script adds the following: it allows to activate unique "spaces" by pressing-and-holding (for `1` sec) any of the 4 buttons. Per space, each button sends a unique MIDI signal for both **short**-tapping and **long**-tapping (`1/4` sec), which makes `4 spaces * 4 buttons * 2 tapping-styles = 32 signals`:

- Space `A` (activation sends `0`)
    - **Short**-tapping `A` sends `1`
    - Short-tapping `B` sends `2`
    - Short-tapping `C` sends `3`
    - Short-tapping `D` sends `4`
    - **Long**-tapping `A` sends `5`
    - Long-tapping `B` sends `6`
    - Long-tapping `C` sends `7`
    - Long-tapping `D` sends `8`
- Space `B` (activation sends `32`)
    - **Short**-tapping `A` sends `33`
    - **Long**-tapping `A` sends `37`
- Space `C` (activation sends `64`)
- Space `D` (activation sends `96`)

All signals are sent through channel `15`.

## Installation & configuration

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

## Giving audio feedback

Triggering some feature using the BlueBoard often will result in an immediately perceivable feedback inside the running app. For example when toggling Play/Pause in AUM, the respective icon will visually change. In some other cases (especially when running multiple apps side by side while only seeing the front most) there will be no such feedback, for example when switching between spaces (by tapping-and-holding its button for a second).

As interacting with a foot controller can be a bit tricky at times, you may want to receive feedback in such a situation, so you can be sure that everything worked out as intented. Imagine you wanted to switch from space `A` to `B`, but you didn't hold the `B` button long enough. So you'd still be in space `A`, but because you don't get any feedback you'd think you're in space `B`!

While the BlueBoard's buttons can be illuminated to give feedback upon interaction, this seems to be [buggy](https://forum.audiob.us/discussion/comment/831829/#Comment_831829). So we're not using this feature at all. Instead, it's easy to let some sampler app listen to the different MIDI notes sent from this script, and play a specific audio file upon it.

For example, I have added [Chameleon](https://apps.apple.com/us/app/chameleon-auv3-sampler-plugin/id1456474953) as another audio channel in AUM, and configured to send the script's MIDI also to it (snake-like arrow button). Now I have loaded a custom preset in Chameleon which plays an audio file "Space 1 selected" when MIDI note `0` arrives, or "Space 2 selected" when MIDI note `32` arrives, etc.

You can add such an audio file for each available note (`0` to `127`). For example, if you want to toggle the effect of your guitar using the `B` button in space `C`, you can assign an audio file "Toggled guitar effect" to MIDI note `66`. Such audio files can easily be generated using a Text-To-Speech engine like <https://voicemaker.in/>.

For live situations, you probably don't want the audience to hear these audio feedbacks. Try to pan them completely to one side (left) of the stereo output, and listen to them by headphones (or monitors). Then forward only the other side (right) to the PA system (you may need an audio splitter cable for this).

## Additional info

For more info see related posts on the [Audiobus forums](https://forum.audiob.us/):

- [Mozaic: How to detect a "long tap" (0.5secs) on my BlueBoard](https://forum.audiob.us/discussion/39866/mozaic-how-to-detect-a-long-tap-0-5secs-on-my-blueboard)
- [How can I tweak my MIDI foot controller so it responds to combined, double clicks, sequences, etc.?](https://forum.audiob.us/discussion/39720/how-can-i-tweak-my-midi-foot-controller-so-it-responds-to-combined-double-clicks-sequences-etc)
- [Is there a MIDI app that allows to send several controls by the press of only one switch?](https://forum.audiob.us/discussion/39721/is-there-a-midi-app-that-allows-to-send-several-controls-by-the-press-of-only-one-switch#latest)
- [AUM: Play short audio files upon receiving specific MIDI signals?](https://forum.audiob.us/discussion/40256/aum-play-short-audio-files-upon-receiving-specific-midi-signals#latest)

## Alternatives

- The [Midifire](https://apps.apple.com/us/app/midifire/id906600872) **Blue Velvet** script adds advanced input gestures like double/triple taps and combinations of taps to the BlueBoard, see [Midifire Blue velvet adds up to 24 midi notes controls to Blueboard](https://forum.audiob.us/discussion/29902/midifire-blue-velvet-adds-up-to-24-midi-notes-controls-to-blueboard/p1). While this seems intriguing, it is too difficult for me and my tap dancing skills.
