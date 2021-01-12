#!/usr/bin/env bash
set -Eeu

wget -q -O - https://www.20minutes.fr/ \
    | grep -m 10 -oE 'teaser-title.*</' \
    | cat -n \
    | sed -e 's/^/\n/' -e 's/teaser-title">//; s+</++' -e "s/&#039;/'/g" 


echo

