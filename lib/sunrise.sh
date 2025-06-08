#!/usr/bin/env bash

loc=$(curl -s ipinfo.io | jq -r '.loc')
lat=${loc%,*}
lon=${loc#*,}

response=$(curl -s "https://api.sunrise-sunset.org/json?lat=$lat&lng=$lon&formatted=0")
sunrise_utc=$(echo "$response" | jq -r '.results.sunrise')

sunrise_local=$(date -d "$sunrise_utc" +"%Y-%m-%d %H:%M:%S %Z")

echo "$sunrise_local"
