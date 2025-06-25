#!/usr/bin/env bash

dir="$HOME/.local/bin/DinoWall"

echo -e "\e[33mInstalling DinoWall...\e[0m"
if [[ -d "dir" ]]; then
  sudo rm -rf "dir"
  sudo mkdir -p "$dir"
else
  sudo mkdir -p "$dir"
fi

echo -e "\e[33mCopying files into $dir...\e[0m"
sudo cp -r "bin" "dir"
sudo cp -r "commands" "$dir"
sudo cp -r "lib" "$dir"
echo -e "\e[33mSetting scripts as executable...\e[0m"
sudo chmod +x "$dir/bin/dinowall"
sudo chmod +x "$dir/bin/dino-daemon"
sudo chmod +x "$dir/commands/count.sh"
sudo chmod +x "$dir/commands/print.sh"
sudo chmod +x "$dir/commands/ss.sh"
sudo chmod +x "$dir/lib/betweenfiles.sh"
sudo chmod +x "$dir/lib/cache.sh"
sudo chmod +x "$dir/lib/count.sh"
sudo chmod +x "$dir/lib/sunrise.sh"
sudo chmod +x "$dir/lib/sunset.sh"

echo -e "\e[32mInstalled DinoWall successfully. Run 'dinowall' to get started!\e[0m"
