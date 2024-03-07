## A place for ... those ideas
##### You know, the ones that seem invariably nocturnal--and which have little basis in our present reality. 
Some may evolve, transmuting far beyond the rudimentary descriptions and concepts below. Most, however, will instead fossilize in place.

^^^^^DRAFT of a draft

1) **Input Methods**: an consisits of two separate but highly synergistic tools which leverage NLP backends to make even poorly-optimized handriting-to-character models useful
   1) Stylus input 
        - Need canvas app - prefer simplicity; low latency >>>> features
          - Could poach pieces from apps I like and use (rnote has 'rnote-engine'; xournalpp with good plugin)
          - List of canvas apps in the wild:
          - List of 2d graphics frameworks and tools:
            - vello - (rust) used by lapce ; https://github.com/linebender/vello
            - piet - (rust) I think vello replaced this; rnote used to use piet-gpu 
   3) Manipulation, introspection and using touch menus
          - First level: c
      
----        

2) **CanvasCompositor**: you've seen "tabs are windows" mode, e.g. for Qutebrowser; but what if ...
   - Now everything's a window ; apps are largely stripped of their independence. They are instead called for specific tasks that a window may want.
   - Disclaimer / TLDR: the compositor+window manager is now a node graph or something

   - Windows sit on a 2d workspace like in any other compositor ; tiling and floating layers, all the jazz
       - BUT the workspace is now abstract, stretching beyond the bounds of the bezel as far as you care to imagine (ok there will probably be a hard stop for safety at some point). The workspace view can be panned, as well as zoomed in and out.
       - This idea comes from newm / newm-atha / niri (last of which is linear, not planar)
   - Workspace can be panned with, e.g. 2 finger touch; zoomed with another gesture
     - NEED VISUALIZER: should look like SOV (sway overview), with spatial representations + labels, not screenshots or glossy icons.
         - ultimately should allow workspace manipulation: pan, zoom, move view to point X workspace
         - as well as drag/drop of windows to, from and within the minimap. Can rearrange windows on the canvas as well as build nested views (trees)

    - **Window content** is the other core piece: this is inspired by ubiquitous dmenu/bemenu/rofi/wofi tools, as well as the much older concept of hypercards
       - (They can consist of traditional, basic "Wayland Apps" and their child-windows / popups)
       - (They can also consist of sets of other windows/subsets);grouped into binary trees and stacks thereof, like in sway
           - The unique window type that CanComp will use:
             TLDR: windows are places we present heterogeneous data for grouping (e.g., sway/i3 "trees"), manipulation or generation (e.g. writing something)
               - A window is just a box with some basic rules for where/when it's allowed to be drawn; the rest of what's in the window is the result of some instructions given to it, which are responsible for its appearance and function
                 - Data in -> some processing of that data, as defined by a config somewhere --> data out; unlike dmenu, the "output" isn't meant to be piped to other places--it ends up being what is displayed
                 - EXAMPLES:
                   - Basics - the window = whatever app is inside of it (text editor, sketch canvas, media player, pdf reader, web browser, etc.)
                   - Data-derived Windows - Reads values from somewhere (local database, remote / web services) -> 
                   - Spatially-derived windows - (these are just i3/sway trees)
                       - can be complex, doesn't just have to be single split frame or simple stack; can be any combination
                       - can be saved for later ( "view templates" )

----

3) **"PipeSurfer"**: should perhaps give this a better name
     - The concept starts with a longstanding dream of a dmenu-replacement that a) featured simple, intuitive use of submenus. (Somehow any ideas beyond a one-dimensional list-picker are herasey to seemingly every dmenu clone developer out there
       - Wofi has been my preferred dmenu-replacement; too bad it got hit with the big D a while ago; I did get it to be persistent. And there is logic in the source for 
       - I considered how I wanted to set up a command-generator that could be used on touchscreens; the user would be able to interatively define each element in a cli's command using a series of dmenus/rofis/wofis/etc.
         - The menus are genenrated by parsing source and support documentation/manuals
         - The menus do not "exist" any more than a waterfall or river does-- they are meta-entities-- much like a balloon that is inflated with air/fluids for its ultimate use, but which is otherwise is not much a than small, limp and empty collection of highly refined petrochemicals.. 
   
