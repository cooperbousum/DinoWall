# DinoWall
### A bash CLI for setting timelapse dynamic wallpapers using `swww`

DinoWall is meant for use on compositors that implement `wlr-layer-shell` (because of swww's limitations) and with 24 hour timelapses starting at sunrise and ending at the next sunrise. Support may come in the future for other formats of timelapse (such as sunset to sunset), though these are not supported in this early version.

### Source Directory
The source directory is essentially a video split into individual image files. These files are then cycled through by DinoWall so that the timelapse syncs with your current daylight cycle (i.e. the wallpaper will show sunrise at sunrise, noon at noon, and sunset at sunset, and everywhere in between). The recommended method for this is either taking your own timelapse using individual photos, editing the sequence so that it conforms to the sunrise to sunrise format, and specifying the directory to DinoWall. Alternatively, you can use ffmpeg to turn a video timelapse into an image sequence: 
```bash
ffmpeg -i video.mp4 out%d.png
```
This will extract every frame from the video, though you can output less, such as once a second with 
```bash
ffmpeg -i input.mp4 -vf fps=1 out%d.png
```
Be sure to run this in the directory you are planning to use for DinoWall else there will be some cleanup required.

## Installation
### Dependencies
- `swww` - wallpaper daemon that allows for wallpaper change animations, like fading. [github](https://github.com/LGFae/swww)
- `jq` - for parsing/updating json variables
Install these with your favorite package manager

I would love to write an install script, but for now follow these steps to install DinoWall
1. Clone this repository into your desired directory
```bash
$ git clone https://github.com/cooperbousum/DinoWall.git
