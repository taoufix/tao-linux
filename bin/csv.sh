#!/bin/bash                                                                                                                                                                                                                                   

cols() {
    sed 's/;/;│ /g' "$1" | column -s";" -t -n
}

if [[ -n "$2" ]]; then
    header="$(cols "$1" | head -n 1)"
    echo "${header}"
    echo "${header}" | sed 's/[^│]/─/g; s/│/┼/g'
    cols "$1" | grep --color "$2"
else
    cols "$1"
fi
