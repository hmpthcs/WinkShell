* **ROCKCHIP_EBC**
  * Tune default grayfour thresholds
  * Install and extend functionality of dbus rockchip_ebc utility
  * Experiment with waveform trimmming and sequencing

* **SWAY / WLROOTS** 
    * TEXT HANDLING: "Tacta Lingua"
    * Input: "Textective"- using text_input protocol, detects if current focus is text-input enabled --> if true, uses input_method_editor protocol to show small touch buttons under the selection (as an fcitx5 plugin): paste/stylus_htr_input/onscreen_kbd/hide
    * Selection: "Selective" - uses primary_selection protocol to detect if primary clipboard is populated --> if true, shows a different touch menu using fcitx5 plugin system.
  * Event listener: e.g. touch-down --> change ebc to bw_mode+fast waveform
    * Use libinput interface; examples=lisgd
  * Implement "drag mode, resize mode" in custom sway build
  * Damage tracking --> algorithm to trigger partial refreshes to remove artifacts?
  * _*Lockscreen:*_ menu options appearing on pwr button press (sleep / lock screen / disable touchscreen / shutdown / reboot / end session / return to login screen or session chooser / open ttyX)
  
* **SYSTEM**
  * Password managment: ripasso?
  * dotfile/config/backup utils
  * GPU monitoring
  * PRIORITY: _*login screen*_, ability to choose sessions

* **FILE MANAGEMENT**
  * Need drag-n-drop;
  * Comprehensive, configurable and touch-friendly interface

* **SOV:** modify json interpreter for use in gtk/qt/any other GUI framework
* **WCP:** consider alternatives
  * eww
  * Investigate "Kando" as marking/radial menu

* **LAVALAUNCHER**
  * Add ability to define and use long-press/hold actions
  * Hot-loading of icons-- display and style button elements conditionally (use existing conditional structure for bar displays as an example);
  * define actions based on focused window: e.g. 'up-arrow' passes 'up' in qutebrowser, but 'pgup' in alacritty
    * Specific apps to consider: zathura; helix; alacritty; qutebrowser; 

* **WAYBAR**
  * add long-press/hold mode; based on recent merge that allows separating mouse BTN_DOWN from BTN_UP events.
  * add custom modules: e.g. show back/fwd/stop/... modules if focused window is qutebrowser
    * can evolve to "global menu" that interacts with focused apps via dbus ... if possible

* **QUTEBROWSER**
  * Consolidate all menus into one script
  
* **EMAIL**
  * Himalaya:
    * figure out why oauth2 sucks
    * Implement GUIs: FZF/SK in terminal first --> GTK and cursive (based on ripasso or exising OOD pulls/branches of himalaya--egui?)

* **TIME MANAGEMENT**
  * Investigate + choose calendar file storage format; utility to read text from xournalpp
  * Calendar widget: drops down from bar; displays entries from calendar file

* **CANVAS DRAWING**
  
* **MACHINE LEARNING TOOLS**
