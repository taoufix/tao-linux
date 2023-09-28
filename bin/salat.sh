#!/usr/bin/env bash
set -Eeuo pipefail

(
  echo "Subh,Duhr,Asr,Maghrib,Isha"
  curl -s https://mawaqit.net/ar/mosquee-de-noisy-le-grand-noisy-le-grand \
    | grep -E -o '"times":\[[^a]+\]' \
    | sed 's/"//g;  s/times:\[//; s/\]//'
) | column -s, -t
