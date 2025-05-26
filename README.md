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

I would love to write an install script, but for now follow these steps to install DinoWall:
1. Clone this repository into your desired directory
```bash
$ git clone https://github.com/cooperbousum/DinoWall.git
```
2. Change into DinoWall and run the install script
```bash
$ cd DinoWall
$ chmod +x install.sh
$ ./install.sh
```
3. DinoWall is now installed! Follow the help menu for next steps.

## Usage
Because dinowall is just a bash script, it is interrupted by things like reboots, hibernation, and sleep events. For this reason, if you want to launch it at startup or after reboot/sleep, you will need to run `dinowall -e` again. In hyprland, for example, I have
```hyprlang
exec-once = bash -c 'sleep 2 && dinowall -e'
```
in my hyprland.conf. The sleep is recommended because immediately after startup, it is likely that all required system timing components are not fully initialized, and the interval between images might not be run correctly. I suggest trying different sleep values to see what works best on your system.

## Final Notes and Roadmap
You might notice that DinoWall runs as a constant process instead of being run intermittently by a job scheduler. This is due to the timing accuracy required between images in order to maintain an accurate sync with the actual daylight cycle. I might try to implement a systemd scheduler (with 1 second precision) to mitigate the performance impact (~5mb ram usage on auto interval on my relatively new laptop). 
As mentioned earlier, I would also like to have more flexibility with timelapse format, and I might try implementing this in the future.
