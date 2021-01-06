# Configuration

It's quite a task to set up everything properly. Be sure to be very careful.

## Preparation

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

## Mozaic scripts

- Start AUM
- Create a new MIDI channel and call it "Mozaic"
- Go through each script file (from top to bottom) and apply their specific installation instructions.

## Audio routing

### MIDI Guitar

- In AUM, create a new audio channel and call it "MIDI Guitar"
- As source, select "Hardware Input" -> "Audio interface channel Y" (where your guitar is plugged in)
- As insert/effect, select "Audio Unit Extension" -> "MIDI Guitar"
- For another insert/effect, drag the slots up to show a "+1" button, press it, then select "Bus Send" -> "Bus B"
- Click the channel's name ("MIDI Guitar")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "Send to Bus B: Bypass"
- Assign MIDI note (not CC!) 12 to channel 3
- Click "MIDI Guitar: Bypass"
- Assign MIDI note (not CC!) 13 to channel 3

### Microphone

- In AUM, create a new audio channel and call it "Microphone"
- As source, select "Hardware Input" -> "Audio interface channel X" (where your microphone is plugged in)
- As insert/effect ("+" button in the middle between source and destination), select "Bus Send" -> "Bus A"
- As destination, select "Mix Bus" -> "Bus P"
- Click the channel's name ("Microphone")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "Send to Bus A: Bypass"
- Assign MIDI note (not CC!) 0 to channel 3 (with "Invert" enabled)

### Keyboard

- In AUM, create a new audio channel and call it "Keyboard"
- As source, select "Audio Unit Extension" -> "Chameleon"
- Click the "Chameleon" button
- Click the "MIDI Route" button (the "backwards S" in the window's menu bar)
- Click "MIDI Guitar @A2:1"
- Click "nanoKEY2 KEYBOARD" (optional)
- Close the window by pressing the "X" button
- As insert/effect, select "Bus Send" -> "Bus A"
- As destination, select "Mix Bus" -> "Bus P"
- Click the channel's name ("Keyboard")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "Send to Bus A: Bypass"
- Assign MIDI note (not CC!) 11 to channel 3 (with "Invert" enabled)

To switch between Chameleon's presets, it needs some presets that can be toggled using MIDI. First of all, create some presets (you can also use the factory presets, but they usually have a lot of reverb by default):

- Click the "Chameleon" button
- Locate a favourite preset (e.g. "Full Concert Grand"), then (if needed) remove "Delay" and "Reverb" (disable "Enable" button) and reduce "Release" to a small value (like 0.10)
- Open the "Presets" menu (the list icon at the top left of the window) and click "+"
- Enter a name (typically similar to the preset's name) and click "Save in AUM"

Repeat this process until you have 3 presets. Then close the window by pressing the "X" button.

Now each preset needs to listen to some MIDI signal so it can be toggled on/off:

- Click the channel's name ("Keyboard")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "MIDI Sources"
- Click "Mozaic @M2:2" (Gtl-Performer)
- Go back (click "Keyboard" button)
- Select "Chameleon: Parameters" -> "Preset Load"
- For the first preset, assign MIDI note (not CC!) 8 to channel 3
- For the second, assign MIDI note 9
- For the third, assign MIDI note 10

### Guitar

- In AUM, create a new audio channel and call it "Guitar"
- As source, select "Mix Bus" -> "Receive from Bus B"
- As insert/effect, select "Audio Unit Extension" -> "Tonebridge"
- For another insert/effect, drag the slots up to show a "+1" button, press it, then select "Bus Send" -> "Bus A"
- As destination, select "Mix Bus" -> "Bus P"
- Click the channel's name ("Guitar")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "Send to Bus A: Bypass"
- Assign MIDI note (not CC!) 1 to channel 3 (with "Invert" enabled)

To switch between Tonebridge's presets, it needs some presets that can be toggled using MIDI. First of all, create some presets:

- Click the "Tonebridge" button
- Click its "Search" button and locate a favourite preset (e.g. "Wish You Were Here")
- Open the "Presets" menu (the list icon at the top left of the window) and click "+"
- Enter a name (typically similar to the preset's name) and click "Save in AUM"

Repeat this process until you have 3 presets. Then close the window by pressing the "X" button.

Now each preset needs to listen to some MIDI signal so it can be toggled on/off:

- Click the channel's name ("Guitar")
- Click the "MIDI settings" button (switches icon at the top left of the menu)
- Click "Mozaic @M2:2" (Gtl-Performer)
- Go back (click "Guitar" button)
- Select "Tonebridge: Parameters" -> "Preset Load"
- For the first preset, assign MIDI note (not CC!) 2 to channel 3
- For the second, assign MIDI note 3
- For the third, assign MIDI note 4

### Send to GTL

- In AUM, create a new audio channel and call it "Sed to GTL"
- As source, select "Mix Bus" -> "Bus A"
- As destination, select "IAA / Audiobus Output" -> "IAA / AB Output 1" (GTL will listen there)

### Receive from GTL

- In AUM, create a new audio channel and call it "Receive from GTL"
- As source, select "Inter-App Audio" -> "Group the Loop (Main Output)"
- As destination, select "Mix Bus" -> "Bus P"

### Main out

- In AUM, create a new audio channel and call it "Main out"
- As source ("+" button on the very top), select "Mix Bus" -> "Bus P"
- As destination (speaker button on the very bottom), select "Hardware Output" -> "Speaker"

### Feedbacker

## Save and close

That's all! Wasn't that easy?

Just save the session as "GTL Wizard" in AUM so you can recall it easily again!
