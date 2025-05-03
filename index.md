# index.md

This file is intended to provide a comprehensive overview of file links and dependencies for WinkShell. Generally speaking, it's a map of how everything is glued together.


## Boot

- Kernel parameters (extlinux.conf, etc.)
- udev rules

## Post-boot, Login

- bashrc, envvars
- greetd
  - --> sway [VIA WAYLAND SESSION FILE]

systemd
  -
- Pinenote Dbus Service
- EGL service (gpu-keepalive)

## Graphical Session

After greetd starts sway via the wayland session ('desktop'??) file, everything else originates from the sway configuration file. Sway's config itself is broken into separate files for readability. The main config is just called `config`, which then sources the rest of sway's config files from the same directory. Meanwhile, a `winkshell-init.sh` script is called within the main config file, which is responsible for initiating most of the widgets and desktop shell items. Each of these is treated in a subsection of their own below.

Sway:
 -

- [WAYLAND SESSION FILE] --> .config/sway/config
  - --> bindings.conf
  - --> appearance.conf
  - --> rules.conf
  - --> bars.conf
    - --> .config/waybar/XX1
    - --> .config/waybar/XX2
    - --> .config/waybar/XX3
  - --> winkshell-init.sh
    - --> [rot8]
    - --> [lisgd]
    - --> [sov]
    - --> [wcp]



### Lisgd

- [lisgd-run.sh???]
  - --> [lavalauncher scripts: lavaapp (left); lavaSCROLL? (right) ]
  - --> [epd refresh script]
  - --> [sway control scripts: next/prev WS; float/unfloat focused; toggle titlebar for focused; kill window]
  - --> [toggle keyboard]


### Waybar

- ~/.config/waybar/waybar_showbtn.config
  - --> style.css
  - --> waybar_modules.json
    - --> [script to show 'waybar_center' + 'waybar_hidebtn' bars, hide 'waybar_showbtn' bar]


- ~/.config/waybar/waybar_hidebtn.config
  - --> style.css
  - --> waybar_modules.json
    - --> [script to hide 'waybar_center + 'waybar_hidebtn' bars, show 'waybar_showbtn' bar]

- ~/.config/waybar/waybar_center.config
  - --> style.css
  - --> waybar_modules.json
    - -->
    - -->
    - --> --> [too fckn many scripts; need to consolidate these..]

### SOV
* update this; I'm using an old commit.
* Double check: do we need the systemd service???

### WCP
This is an utter mess. Shame..

### Rot8

*Using hmpthcs fork on github. This enables pre-hooks and post-hooks (before and after rotations). Might be obsolete if the pull request it was borrowed from has been merged. Reminder to check up on this..


### Lavalauncher

Requires phosphor icons
