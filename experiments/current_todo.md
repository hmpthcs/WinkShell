### Priorities 
* #### Test various newm-atha configs

* #### Optimizing drawing performance
   - Test barebones paint apps under various envs/conditions:
   - **PROFILE GPU, FRAMERATE, INPUT LATENCY, ETC.** --> how?
   - Envs:
      - opengl / egl vs. software
      - vulkan vs. panfrost vs. swrast
      - framebuffer (how?)
      - Egui vs. glew vs. iced vs. gtk-rs vs. tauri
         - javascript? LLRT?
   - Input
      - Try evdev, no libinput
   - Conditions:
      - Vulkan/Mesa/Panfrost variables: (to follow)
      - GDK/GSK/GTK env variables (on repaints, etc.)

* #### Conceptual Shell
   - Min-browser experiments: appearance first...
   - **CLIPBOARD:**
      - consider as preprequisite for everything related to archiving/digitial-gardening
   - Test knowledge managment servics (forked, ink&switch)
     
