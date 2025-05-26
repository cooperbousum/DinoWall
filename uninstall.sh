#!/usr/bin/env bash

if [[ -L /usr/bin/dinowall ]]; then
  echo -e "\e[31mRemoving dinowall link...\e[0m"
  sudo rm /usr/bin/dinowall
fi

if [[ -L /usr/bin/dino-daemon ]]; then
  echo -e "\e[31mRemoving dino-daemon link...\e[0m"
  sudo rm /usr/bin/dino-daemon
fi

if [[ -d "$HOME/.local/bin/DinoWall" ]]; then
  sudo rm -rf "$HOME/.local/bin/DinoWall"
fi

echo -e "\e[32mUninstalled DinoWall successfully"
