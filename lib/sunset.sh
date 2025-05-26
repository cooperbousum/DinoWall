#!/usr/bin/env bash

loc=$(curl -s ipinfo.io | jq -r '.loc')
lat=${loc%,*}
lon=${loc#*,}

response=$(curl -s "https://api.sunrise-sunset.org/json?lat=$lat&lng=$lon&formatted=0")

sunset_utc=$(echo "$response" | jq -r '.results.sunset')

sunset_local=$(date -d "$sunset_utc" +"%Y-%m-%d %H:%M:%S %Z")

echo "$sunset_local"
