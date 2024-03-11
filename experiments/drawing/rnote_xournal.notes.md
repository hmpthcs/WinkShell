## GTK Environment Variables

* **REFERENCE:** https://docs.gtk.org/gtk4/running.html#:~:text=Environment%20variables,use%20some%20additional%20environment%20variables.
* **Best performance** observed in rnote so far: `GSK_RENDERER=opengl GSK_MAX_TEXTURE_SIZE=1 rnote`

* Missing functionality:

```
 $ GSK_DEBUG=renderer rnote
 "renderer" is only available when building GTK with G_ENABLE_DEBUG. See GSK_DEBUG=help
```

  **VULKAN DISABLED AT BUILD TIME**

```
 $ GSK_DEBUG=cairo rnote
 "cairo" is only available when building GTK with G_ENABLE_DEBUG. See GSK_DEBUG=help
```
  --> but this works?: `$ GSK_RENDERER=cairo rnote`

```
 $ GSK_DEBUG=opengl rnote
 "opengl" is only available when building GTK with G_ENABLE_DEBUG. See GSK_DEBUG=help
```

 * Tried (non-exhaustive):
    - `GDK_DEBUG=no-vsync rnote` (forces instant repaint)
    - `GDK_DEBUG=gl-gles rnote` 
    - 
