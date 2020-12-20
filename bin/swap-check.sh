#!/bin/bash

function psformat() {
    ps --format 'euser,bsdstart,%cpu,%mem,cmd' "$@"
}

grep VmSwap  /proc/[0-9]*/status | sort -nr -k 2,2 | head | (
    print_header=true
    while read line; do
	pid=$(echo "$line" | sed 's+/proc/\(.*\)/status:VmSwap:.*+\1+')
	swp=$(echo "$line" | sed 's+/proc/.*/status:VmSwap:\s*\(.*\)+\1+; s/ //')
	if $print_header; then
   	    paste <(echo -e "SWAP\n${swp}") <(psformat --pid ${pid})
	    print_header=false
	else
	    paste <(echo -e "${swp}") <(psformat -h --pid ${pid})
	fi
    done
)
