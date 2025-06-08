#!/usr/bin/env bash

dino_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..

# Count image files in source directory
count() {
  echo "Counting image files in $1"
  num_files=$("$dino_dir/lib/count.sh" $1)
  echo "Found $num_files image files"
}
