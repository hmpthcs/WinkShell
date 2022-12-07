# WinkShell
Collected applications, configurations and scripts for using a wlroots-based compositor with an EPD (aka e-ink). Currently supports sway only. Developed for Pinenote.


### Status as of 06 December 2022:
There is not yet any shell script to automate installation of necessary apps and placement scripts and configuration files. All of the files and instructions in this repository are tailored to work with Sway. Pieces of course can be cherry-picked for use with any other appropriate environment. Some, however (such as SOV, which relies fundamentally on swaymsg), may need more extensive modification to work outside of sway, if at all possible. Rotation not yet implemented--landscape mode only.

***Abbreviated app-specific notes and caveats*** (see table at the end of this document for a more comprehensive listing)
* Sway
   * I tried to place all the WinkShell-specific bits at the end of the config file (needs overhaul). Lots of sway functionality not yet taken advantage of, such as tabbed, stacking, scratchpad views, "modes" and others. Also need to be able to manipulate windows (resize/move within and to other workspaces).
   * window borders, as well as margins at the edge of the screen, need to be addressed (can't tell which has the focus; a tiny but noticeable bit of the container view bleeds beyond the visible screen).
* Waybar
   * most modules are dummy indicators: at some point they should all for the most part open a menu or app on being tapped. No system tray as I intend to use wofi menus or similar for such functions as wifi, bluetooth and power management.
* SOV
   * focused workspace text color doesn't appear to be modifiable without changing it globally for SOV. This is ugly..but I really want to shoot for a systemwide theme of focused=black/very dark, unfocused=white, as the alternatives lose important contrast (if using gray tones here) or look gross (black for all unfocused, white only for focused). Maybe some heavy, bold borders could work here and elsewhere to follow the dark=focus pattern.
* nwg-drawer
   * can't seem to scroll all the way to the right. Dunno.
* lavalauncher
   * icons: are from the phosphor icon set; some may be not the most intuitive. I like fontawesome too, but I think we can do better here.
   * scripts/actions: most are dummy buttons; top button is a fallback to close the lavalauncher instance in case lisgd fails. Have a look at lavamain.conf to customize--its very straightforward relative to other configs.
* lisgd
   * make sure your environment variables are set properly. This was not working for me until I made a number of changes to correct missing envvars with greetd as my login manager; not sure which of those changes was the winner.
   * some gesture actions seem to temporarily withhold touchscreen input to lisgd. For example, having lisgd open lavalauncher directly as a command listed after a `-g` flag would make lavalauncher the only app that would respond to touchscreen input; on closing/killing the lavalauncher instance, gestures made since lavalauncher had been open were released sequentially to lisgd. This was not unique to lavalauncher and seems to be solved by directing sway to handle opening apps using `swaymsg 'exec "<command>"'` (quote pattern seems important-idk?).
   * current flow: sway config executes lisgd-run.sh -> lisgd-run.sh executes lisgd itself -> lisgd then executes shell scripts to control applications in response to gestures. I did this to allow better manipulation of gesture actions. Future changes could place conditional statements in lisgd-run.sh to allow lisgd's actions to depend not only on gesture, but some other input (e.g., a mode button toggle). It might make sense to also do away with the app-specific scripts, instead just placing their contents in the lisgd-run script.
   * Note on scripts: these are very messy right now. Planning to replace most of the "toggle" scripts with separate on/show and off/hide scripts. Some started as toggles as I was using button presses to trigger these actions before.

**Configuration files** are found in WinkShell/config. These are placed in ~/.config/[specific application]

**Shell scripts** are found in WinkShell/scripts. At the moment a number of apps look for the scripts they need in /usr/local/bin. 

### Instructions (for sway running on arch linux)

pacman -S sway waybar 

***Waybar***

***SOV***

***lisgd***

***lavalauncher***

#### Issues and "Opportunities":

Item / App | To be done | Known bugs
--- | --- | ---
Install | Provide script to automate app installation, script and configuration placement<br/> - [ ] First for Sway<br/> - [ ] Other compositors<br/> | 
Sway | - [ ] Borders (can't tell which container has focus)<br/> - [ ] come up with system for resizing windows<br/> - [ ] method for sending window to different workspace - [ ] manage toggling stacking/tabbed windows and horizontal/vertical split views<br/> - [ ] find way to enter a new/empty workspace<br/> | 
wvkbd | - [ ] fix appearance (currently still dark theme)<br/> - [ ] resize (currently pretty short)<br/> - [ ] develop better layers, maybe some app-specific layers<br/> |
Waybar | - [ ] verify that waybar show/hide is consistent with built-in toggle feature<br/> - [ ] on-click actions need to be overhauled<br/> - [ ] potentially remove workspace buttons (pending testing of SOV + gesture functionality)<br/> |
SOV | - [ ] figure out why instance started in sway config appears to not be working<br/> - [ ] modify shell script to hide-> show (refresh) SOV whenever switching workspace view or window location (workspace number/name and position within workspace)<br/> |
lisgd | - [ ] add current command to sway config; ALTERNATIVE: have sway config execute a script that runs lisgd, picking a gesture set based on other conditions (e.g., if a modifier-button has been preseed)<br/> - [ ] verify lavalauncher gesture works<br/> - [ ] add gestures or use button-modifier+gesture to move windows within workspaces<br/> | 
Lavalauncher | - [ ] remove "lavahidden," make "lavamain" be default for sway startup and lisgd gesture<br/> - [ ] verify that show/hide is consistent with built-in toggle feature<br/> - [ ] overhaul buttons in "lavamain" (remove those replaced by gestures and consider which make sense to place here)<br/> | 
Scripts (general) | - [ ] Run all lisgd gesture actions from a common script using variables for the actions - [ ] review for hangups causing unresponsiveness and clean scripts up<br/> - [ ] review each app-specific with respect to "toggle" vs. separate "show", "hide"/"kill" scripts<br/> | 
Menus | - [ ] select a menu system (wofi/rofi/dmenu-like) and generate the following:<br/>    * power/shutdown/suspend<br/>    * wifi<br/>    * bluetooth<br/>   * screen (brightness+EPD)<br/>| 
Rot8 | - [ ] not working- investigate<br/> - [ ] generate configs for portrait view for waybar + lisgd | 
nwg-drawer | - [ ] clean up config: seems wider than screen area
Other | - [ ] Icons - consider new set for lavalauncher + waybar<br/> - [ ] Simple EPD refresh method<br/> - [ ] app-specific configs: firefox, gedit, nemo/thunar/etc.<br/> |
Icons | - [ ] lavalauncher + waybar: find some that are easier to install and look better<br/> - [ ] nwg-drawer/general systemwide: find eink friendly set<br/> | 
Systemd | - [ ] suspend hooks (if image preferred over blanked screen during suspend)<br/> - [ ] establish startup screen brightness + EPD settings</br> - [ ] (general) sift through systemd setup to clarify config required to make everything work<br/> |







