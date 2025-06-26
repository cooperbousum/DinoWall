### DinoWall
DinoWall is a utility for setting wallpapers according to the time of day. It is meant for 24-hour timelapses, from sunrise to sunrise. It runs on all wl-roots compositors due to its reliance on hyprpaper for setting the wallpaper. 

## Dependencies
- `hyprpaper` and `hyprctl`: Wallpaper setting
- `jq`: for json parsing of persistent variables
- `bc`: precision rounding

## Installation
- Clone this repository:
```
$ git clone https://github.com/cooperbousum/DinoWall.git
```
- Run the install script:
```
$ cd DinoWall
$ chmod +x install.sh
$ ./install.sh
```
- Run DinoWall with `dinowall`

## Usage
Most usage is explained by the help menu (`dinowall -h`), but the setup for the wallpaper source directory can be confusing. The source directory is assumed to be a collection of images from a timelapse, with names corresponding to their chronological order.
