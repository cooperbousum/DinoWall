#!/usr/bin/env bash

start="$1"
end="$2"

start_sec=$(date -d "${start}" +%s)
end_sec=$(date -d "${end}" +%s)

diff=$((end_sec - start_sec))
echo $diff
