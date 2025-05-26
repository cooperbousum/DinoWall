#!/usr/bin/env bash

dino_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..

set_var() {
  jq --arg k "$1" --arg v "$2" '.[$k] = $v' "$dino_dir/lib/cache.json" >tmp && mv tmp "$dino_dir/lib/cache.json"
}

get_var() {
  echo "$(jq -r --arg k "$1" '.[$k]' "$dino_dir/lib/cache.json")"
}
