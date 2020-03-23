# Image and video processing - by MarcosJSP

The objective of this project is to familiarize myself with image and video processing. For the sake of this i made three different camera filters as you can see here:

<img align="center" src="readme assets/demo.gif" alt="Demo gif"></img>

<div align="center"><b>Figure 1 - Image and video processing Demo</b></div>



## Development

- Trace effect [key 1]

The moving items leave a trace wherever they move from. This effect is achieved by drawing just a limited amount of the pixels captured by the camera into the screen each frame.



- Brightness effect [key 2]

The screen is filled with circles that grow bigger the lighter the pixels captured by the camera are.



- Dithering effect [key 3]

The dithering effect is achieved using the [Floyd–Steinberg dithering algorithm](https://en.wikipedia.org/wiki/Floyd%E2%80%93Steinberg_dithering)



## Tools used & References

- Everything that i learned came from https://processing.org/ && https://http://www2.ulpgc.es/.
- Processing libraries used:
	- **gif-animation** by [extrapixel](https://github.com/extrapixel)
	- **video** by [The processing foundation](https://processing.org/)
