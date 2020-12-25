# Pink Floyd - Wish you were here

Interpretation by "Josh wants to be a band", see <josh.ch>

## Intro

### 1st guitar (epic riff)

🎤 ❌ 1    @ToggleSendMicrophone
🎸 ✔️ 3    @PrepareGuitarPreset3, @ToggleSendGuitar
⏲️ 10       @IncreaseClockLength (2x)
---
🅾️🧱 1     @RecordNextLoopInGroup1

### 2nd guitar

🅾️🧱 1     @RecordNextLoopInGroup1
🎸 1        @PrepareGuitarPreset1
---
🎸 ✔️      @ToggleSendGuitar

## Verse 1

### So, so you think you can tell...

⏲️ 8        @DecreaseClockLength (2x)
🅾️🧱 2      @RecordNextLoopInGroup2
🎸 1        @PrepareGuitarPreset1
---
🎸 ✔️      @ToggleSendGuitar

### Did they get you to trade...

🎸 3       @PrepareGuitarPreset3
🅾️🧱 2     @RecordNextLoopInGroup2
---
🎸 ✔️      @ToggleSendGuitar

## Intro

### Drums (1 bar, then "dideldü")

▶️🧱 1     @ToggleAndSelectGroup1

    Call @DecreaseClockLength // 7
    Call @DecreaseClockLength // 6
    Call @DecreaseClockLength // 5
    Call @DecreaseClockLength // 4
    Call @DecreaseClockLength // 3
    Call @DecreaseClockLength // 2
    Call @DecreaseClockLength // 1
    Call @RecordNextLoopInGroup0 // TODO: Add timer when also a non-master group was selected before?

    Call @PrepareKeyboardPreset1
  elseif step = 10
    Call @ToggleSendMicrophone // On
    Call @ToggleSendKeyboard

  // Verse 2 / Chorus: How I wish... (x3)
  elseif step = 11 // 1/3, m+g
    Call @IncreaseClockLength // 2
    Call @IncreaseClockLength // 3
    Call @IncreaseClockLength // 4
    Call @IncreaseClockLength // 5
    Call @IncreaseClockLength // 6
    Call @IncreaseClockLength // 7
    Call @IncreaseClockLength // 8
    Call @RecordNextLoopInGroup2

    Call @PrepareKeyboardPreset1
  elseif step = 12
    Call @ToggleSendKeyboard
  elseif step = 13 // 2/3, m+g
    Call @RecordNextLoopInGroup2
    Call @PrepareGuitarPreset2
  elseif step = 14
    Call @ToggleSendGuitar
  elseif step = 15 // 3/3, m+g
    // Do some manual stuff here, e.g. mute drums for a moment at the end
    Call @PrepareGuitarPreset3
  elseif step = 16
    Call @ToggleSendGuitar

  // Intro (again)
  elseif step = 17
    Call @ToggleAndSelectGroup1
  elseif step = 18
    // Nothing

  // No step left
