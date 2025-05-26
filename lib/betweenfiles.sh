#!/usr/bin/env bash

files=($(ls $1 | sort))
start=0
end=0

for i in "${!files[@]}"; do
  [[ "${files[i]}" == *sunrise* ]] && start=$i
  [[ "${files[i]}" == *sunset* ]] && end=$i && break
done

count=$((end - start + 1))
echo "$count"
