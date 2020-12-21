#!/usr/bin/env bash
set -Eeuo pipefail

(
  echo "Subh,Duhr,Asr,Maghrib,Isha"
  wget -q https://mawaqit.net/ar/m/mosquee-de-noisy-le-grand-noisy-le-grand -O - \
    | grep -E -o '"times":\[[^a]+\]' \
    | sed 's/"//g;  s/times:\[//; s/\]//'
) | column -s, -t
