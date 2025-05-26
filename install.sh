#!/usr/bin/env bash

current=$(pwd)
destination="$HOME/.local/bin"

echo -e "\e[33mCreating installation directory\e[0m"
if [[ -d "$destination/DinoWall" ]]; then
  sudo rm -rf "$destination/DinoWall"
fi
sudo mkdir -p "$destination/DinoWall"

sudo cp -r "$current/bin" "$destination/DinoWall"
sudo cp -r "$current/commands" "$destination/DinoWall"
sudo cp -r "$current/lib" "$destination/DinoWall"
sudo chmod +x "$destination/DinoWall/bin/dino-daemon"
sudo chmod +x "$destination/DinoWall/bin/dinowall"
sudo chmod +x "$destination/DinoWall/lib/betweenfiles.sh"
sudo chmod +x "$destination/DinoWall/lib/cache.sh"
sudo chmod +x "$destination/DinoWall/lib/count.sh"
sudo chmod +x "$destination/DinoWall/lib/sunrise.sh"
sudo chmod +x "$destination/DinoWall/lib/sunset.sh"
sudo chmod +w "$destination/DinoWall/lib/cache.json"

if [[ -L /usr/bin/dinowall ]]; then
  echo -e "\e[31mRemoving old dinowall link...\e[0m"
  sudo rm /usr/bin/dinowall
fi

echo -e "\e[33mCreating new dinowall link..\e[0m."
sudo ln -s "$destination/DinoWall/bin/dinowall" /usr/bin/dinowall

if [[ -L /usr/bin/dino-daemon ]]; then
  echo -e "\e[31mRemoving old dino-daemon link...\e[0m"
  sudo rm /usr/bin/dino-daemon
fi

echo -e "\e[33mCreating new dinowall link...\e[0m"
sudo ln -s "$destination/DinoWall/bin/dino-daemon" /usr/bin/dino-daemon

echo -e "\e[32mInstalled DinoWall successfully.\e[0m"
dinowall
