# WinkShell
Collected applications, configurations and scripts for using a wayland roots-based compositor with an EPD (aka e-ink). Currently supports sway only. Developed for Pinenote.


*Configuration files* are found in WinkShell/config. These are placed in ~/.config/[specific application]

*Shell scripts* are found in WinkShell/scripts. At the moment a number of apps look for the scripts they need in /usr/local/bin.
* Sway
  *
* Waybar
  *
* SOV
  *
* nwg-drawer
  *
* lavalauncher
  *
* lisgd
  *toggle_kbd.sh
  *toggle_waybar.sh
  *(toggle_sov.sh- nonexistant right now)
  *toggle_lavalauncher.sh


### Status as of 06 December 2022:
There is not yet any shell script to automate installation of necessary apps and placement scripts and configuration files. All of the files and instructions in this repository are tailored to work with Sway. Pieces of course can be cherry-picked for use with any other appropriate environment.

#### Issues and "Opportunities":

Item / App | To be done | Known bugs
--- | --- | ---
Install | Provide script to automate app installation, script and configuration placement<br/> - [ ] First for Sway<br/> - [ ] Other compositors<br/> | 
Sway | - [ ] Borders (can't tell which container has focus)<br/> - [ ] come up with system for resizing windows<br/> - [ ] manage toggling stacking/tabbed windows and horizontal/vertical split views<br/> | 
wvkbd | - [ ] fix appearance (currently still dark theme)<br/> - [ ] resize (currently pretty short)<br/> - [ ] develop better layers, maybe some app-specific layers<br/> |
Waybar | - [ ] verify that waybar show/hide is consistent with built-in toggle feature<br/> - [ ] on-click actions need to be overhauled<br/> - [ ] potentially remove workspace buttons (pending testing of SOV + gesture functionality)<br/> |
SOV | - [ ] figure out why instance started in sway config appears to not be working<br/> - [ ] modify shell script to hide-> show (refresh) SOV whenever switching workspace view or window location (workspace number/name and position within workspace)<br/> |
lisgd | - [ ] add current command to sway config<br/> - [ ] verify lavalauncher gesture works<br/> - [ ] add gestures or use button-modifier+gesture to move windows within workspaces<br/> | 
Lavalauncher | - [ ] remove "lavahidden," make "lavamain" be default for sway startup and lisgd gesture<br/> - [ ] verify that show/hide is consistent with built-in toggle feature<br/> - [ ] overhaul buttons in "lavamain" (remove those replaced by gestures and consider which make sense to place here)<br/> | 
Scripts (general) | - [ ] review for hangups causing unresponsiveness and clean scripts up<br/> - [ ] review each app-specific with respect to "toggle" vs. separate "show", "hide"/"kill" scripts<br/> | 
Menus | - [ ] select a menu system (wofi/rofi/dmenu-like) and generate the following:<br/> * power/shutdown/suspend<br/> * wifi<br/> * bluetooth<br/> * screen (brightness+EPD)<br/>| 
Rot8 | - [ ] not working- investigate<br/> - [ ] generate configs for portrait view for waybar + lisgd | 
nwg-drawer | - [ ] clean up config: seems wider than screen area
Other | - [ ] Icons - consider new set for lavalauncher + waybar<br/> - [ ] Simple EPD refresh method<br/> - [ ] app-specific configs: firefox, gedit, nemo/thunar/etc.<br/> |
Icons | - [ ] lavalauncher + waybar: find some that are easier to install and look better<br/> - [ ] nwg-drawer/general systemwide: find eink friendly set<br/> | 
Systemd | - [ ] suspend hooks (if image preferred over blanked screen during suspend)<br/> - [ ] sift through systemd setup to clarify config required to make everything work<br/> |







