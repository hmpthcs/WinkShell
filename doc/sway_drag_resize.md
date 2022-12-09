## Concepts for moving or resizing windows without the ability to physically hold down a floating modifier

### Can you drag / resize without a modifier (i.e., mouse only)?

https://www.reddit.com/r/swaywm/comments/etchzk/dragging_windows_around_without_floating_modifier/

Method: lock the Mod4 modifier in custom xkb symbols and compat files.
  - turn the thumb button of mouse into a Mod4 latch key by the following xkb configuration:
      ```
      key <I179> {
          actions[Group1] = [ LatchMods(modifiers=Mod4) ]
      };
      ```
- doing the same thing with LockMods does not work in sway
- xev can see the modifier mask 0x40 for Mod4 when it is locked, but sway ignores the locked modifier for subsequent keypresses.
- but, can create a shift lock with LockMods(modifiers=Shift)--so locking is supported (maybe not for mouse buttons though)

- Bind thumb button to send ["KEY_CONFIG"] (KEY_CONFIG is <I179> in /usr/share/X11/xkb/keycode/evdev)
- Can move windows around and switch workspaces by scrolling
- Unlatch by pressing the thumb button again


### Alternative Approach: toggle sway mode change with lavalauncher button press
- set mode in sway config that shows title bars+borders; make them huge
  -also set sway config to allow dragging by title bar, resizing with border
- bindsym (single release event) to switch modes (sway config)
- execute command on lavalauncher button press: trigger bound mode switch key using dotool/other virtual input event generator.
- 
