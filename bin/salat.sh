#!/usr/bin/env bash
set -Eeuo pipefail

mawaqit() {

mosque="mosquee-de-noisy-le-grand-noisy-le-grand"
echo "$(date +%R) - $mosque"

(
  echo "Subh,Duhr,Asr,Maghrib,Isha"
  curl -s https://mawaqit.net/ar/$mosque \
    | grep -E -o '"times":\[[^a]+\]' \
    | sed 's/"//g;  s/times:\[//; s/\]//'
) | column -s, -t

}


kanz() {
    city="noisy-le-grand/93160"
    echo "$(date +%R) - $city"
    echo -e "Subh\tChour\tDuhr\tAsr\tMaghrib\tIsha"
    (
#	echo -e "Subh\nDuhr\nAsr\nMaghrib\nIsha"
	curl -s "https://www.al-kanz.org/horaire-de-priere/${city}/" | egrep 'td class="horaire-' | sed 's/.*>\(.*\)<.*/\1/'
    ) | column
}

kanz

