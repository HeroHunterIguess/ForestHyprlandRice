#!/bin/bash

API_KEY="____ENTER____KEY____HERE____"
CITY="____ENTER____CITY____HERE____"
UNITS="imperial" # or "imperial" for Fahrenheit

weather=$(curl -sf "https://api.openweathermap.org/data/2.5/weather?q=${CITY}&units=${UNITS}&appid=${API_KEY}")
if [ ! -z "$weather" ]; then
    temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    echo "${temp}°F"
else
    echo "N/A"
fi
