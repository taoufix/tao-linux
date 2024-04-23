#!/usr/bin/env bash
set -Eeuo pipefail

mosque="mosquee-de-noisy-le-grand-noisy-le-grand"
echo "* $mosque"

(
  echo "Subh,Duhr,Asr,Maghrib,Isha"
  curl -s https://mawaqit.net/ar/$mosque \
    | grep -E -o '"times":\[[^a]+\]' \
    | sed 's/"//g;  s/times:\[//; s/\]//'
) | column -s, -t
