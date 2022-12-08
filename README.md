
# WinkShell
Collected applications, configurations and scripts for using a wlroots-based compositor with an EPD (aka e-ink display). Currently supports Sway only. Developed for Pinenote. 

(apologies, better pics are coming..at the moment I just have my dying phone, leaving only part of the image in focus).

![alt text](https://i.imgur.com/12dgA7T.jpg)


![alt text](https://i.imgur.com/aIgDlWj.jpg)

More pics: https://imgur.com/a/tXtyWw2

****Much credit goes to all of those sharing their Pinenote work on the Pine64 Matrix channel (Come join the discussion: https://matrix.to/#/#pinenote:matrix.org)****

****Based heavily on work found here, among other places:****
* https://github.com/0cc4m/pinenote-misc (here you'll find info on getting hardware acceleration working with mesa on the Pinenote)
* https://github.com/m-weigand/mw_pinenote_misc (extensive work and documentation on rockchip EBC driver)
* https://github.com/DorianRudolph/pinenotes (lots of info here on flashing the device and the initial setup for arch arm)
* https://musings.martyn.berlin/ (in particular, see posts dated Aug 16 2022 and older for Pinenote specifics)

****Relevant Pine64 wiki pages:****
* https://wiki.pine64.org/wiki/PineNote_Development
* https://wiki.pine64.org/wiki/PineNote_Development/TODOs
* https://wiki.pine64.org/wiki/PineNote:_Getting_Started
* https://wiki.pine64.org/wiki/PineNote_Development/Building_Kernel

### Status as of 06 December 2022:
There is not yet any shell script to automate installation of necessary apps and placement scripts and configuration files. All of the files and instructions in this repository are tailored to work with Sway. Pieces of course can be cherry-picked for use with any other appropriate environment. Some, however (such as SOV, which relies fundamentally on swaymsg), may need more extensive modification to work outside of sway, if at all possible. Rotation not yet implemented--landscape mode only.

I have only been generating configuration files for the core apps used by the shell and for those that I use or am familiar with. Please help expand this project by sharing e-ink-tailored configs for apps that you use. Moreover, please don't hesitate to let me know if I have missed anything or if you have any problems getting this to work.

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


### Instructions (for sway running on arch linux)


**Configuration files** are found in WinkShell/config. These are placed in ~/.config/[specific application]

**Shell scripts** are found in WinkShell/scripts. At the moment a number of apps look for the scripts they need in /usr/local/bin.  

***General Stuff***

```pacman -S sway waybar wofi otf-font-awesome```

***SOV***
``` git clone https://github.com/milgra/sov.git
cd sov
meson setup build --buildtype=release
ninja -C build
sudo ninja -C build install
cp contrib/systemd/sov.{service,socket} ~/.local/share/systemd/user/
systemctl daemon-reload --user
systemctl enable --now --user sov.socket 
```

***lisgd***

Install from source: https://git.sr.ht/~mil/lisgd

Or use AUR https://aur.archlinux.org/packages/lisgd

(or whatever the repository for your distribution that has lisgd) 

***lavalauncher***

```git clone https://git.sr.ht/~leon_plickat/lavalauncher
cd lavalauncher
meson build
ninja -C build
sudo ninja -C build install
```

If you intend to use as-is, you'll need the icon set available here: https://phosphoricons.com/

Place in `/usr/share/icons/phosphoricons` (or alternatively install the proper way).

***nwg-drawer***

```git clone https://github.com/nwg-piotr/nwg-drawer.git
cd nwg-drawer
make get
make build
sudo make install
```

***wvkbd***

* prerequisites: 
   * cairo
   * pango
   * wayland-client
   * xkbcommon
   
* Note: I haven't done any configuration for this one. Thus it looks like a phone keyboard--dark and cramped. Config is done prior to compilation, yielding a custom binary. See: https://github.com/jjsullivan5196/wvkbd

```git clone https://github.com/jjsullivan5196/wvkbd.git
make
## not sure if this is correct; in any case, your binary from the step above is wvkbd-mobintl. 
# make install
```

### Issues and "Opportunities":

Item / App | To be done | Known bugs
--- | --- | ---
Install | Provide script to automate app installation, script and configuration placement<br/> - [ ] First for Sway<br/> - [ ] Other compositors<br/> | 
Sway | - [ ] Borders (can't tell which container has focus)<br/> - [ ] come up with system for resizing windows<br/> - [ ] method for sending window to different workspace - [ ] manage toggling stacking/tabbed windows and horizontal/vertical split views<br/> - [ ] find way to enter a new/empty workspace<br/> - [ ] come up with simple way to toggle fullscreen for focused window and still receive touch input to exit fullscreen<br/> | 
wvkbd | - [ ] fix appearance (currently still dark theme)<br/> - [ ] resize (currently pretty short)<br/> - [ ] develop better layers, maybe some app-specific layers<br/> |
Waybar | - [ ] verify that waybar show/hide is consistent with built-in toggle feature<br/> - [ ] on-click actions need to be overhauled<br/> - [ ] potentially remove workspace buttons (pending testing of SOV + gesture functionality)<br/> |
SOV | - [ ] figure out why instance started in sway config appears to not be working<br/> - [ ] modify shell script to hide-> show (refresh) SOV whenever switching workspace view or window location (workspace number/name and position within workspace)<br/> |
lisgd | - [ ] add current command to sway config; ALTERNATIVE: have sway config execute a script that runs lisgd, picking a gesture set based on other conditions (e.g., if a modifier-button has been preseed)<br/> - [ ] verify lavalauncher gesture works<br/> - [ ] add gestures or use button-modifier+gesture to move windows within workspaces<br/> | 
Lavalauncher | - [ ] remove "lavahidden," make "lavamain" be default for sway startup and lisgd gesture<br/> - [ ] verify that show/hide is consistent with built-in toggle feature<br/> - [ ] overhaul buttons in "lavamain" (remove those replaced by gestures and consider which make sense to place here)<br/> | 
Scripts (general) | - [ ] Run all lisgd gesture actions from a common script using variables for the actions - [ ] review for hangups causing unresponsiveness and clean scripts up<br/> - [ ] review each app-specific with respect to "toggle" vs. separate "show", "hide"/"kill" scripts<br/> | 
Menus | - [ ] select a menu system (wofi/rofi/dmenu-like) and generate the following:<br/>    * power/shutdown/suspend<br/>    * wifi<br/>    * bluetooth<br/>   * screen (brightness+EPD)<br/>| 
Rot8 | - [ ] not working- investigate<br/> - [ ] generate configs for portrait view for waybar + lisgd | 
nwg-drawer | - [ ] clean up config: seems wider than screen area | 
Browser (firefox) | - [ ] modify to be only one bar instead of two (tabs + nav/menus)<br/> - [ ] find an existing or generate a new theme with firefox interface colors and border styles optimized for e-ink<br/> - [ ] assess existing extensions for forcing webpage colors to be e-ink friendly; also assess those which allow on-the-fly style tweaks<br/> | 
GTK | - [ ] evaluate whether a ground-up custom GTK theme would be better than HighContrast<br/> | 
Other | - [ ] Simple EPD refresh method<br/> - [ ] app-specific configs: gedit?, nemo/thunar/etc.<br/> |
Icons | - [ ] lavalauncher + waybar: find some that are easier to install and look better<br/> - [ ] nwg-drawer/general systemwide: find eink friendly set<br/> | 
Touch and Stylus | -[ ] investigate ways to improve touch arbitration globally and in specific apps (e.g., xournal++)<br/> | 
Systemd | - [ ] suspend hooks (if image preferred over blanked screen during suspend)<br/> - [ ] establish startup screen brightness + EPD settings</br> - [ ] (general) sift through systemd setup to clarify config required to make everything work<br/> |







