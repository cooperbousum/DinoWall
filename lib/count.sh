#!/usr/bin/env bash

# Count image files in source directory
i=0
shopt -s nullglob # Prevent empty file extensions from being treated as included files
for file in "$1"/*.{jpg,jpeg,png,gif,pnm,tga,tiff,webp,bmp,ff}; do
  let "i++"
done
echo $i
