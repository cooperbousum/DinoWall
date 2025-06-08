#!/usr/bin/env bash

print() {
  dino_dir=$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..
  jq '.' $dino_dir/lib/cache.json
}
