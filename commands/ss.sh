#!/usr/bin/env bash

# Set file as sunrise handle
ssr() {
  filename=$(basename -- "$1")
  extension="${filename##*.}"
  filename="${filename%.*}"
  echo "Renaming to: $2/${filename}sunrise.$extension"
  mv $1 "$2/${filename}sunrise.$extension"
}

sss() {
  filename=$(basename -- "$1")
  extension="${filename##*.}"
  filename="${filename%.*}"
  echo "Renaming to: $2/${filename}sunset.$extension"
  mv $1 "$2/${filename}sunset.$extension"
}
