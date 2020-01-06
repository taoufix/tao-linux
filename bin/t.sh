#!/bin/bash

tt=(s 7 a)
for t in 0 1 2; do
    echo -n "${tt[t]}:"
    for i in {1..33}; do 
	read -s -n 1 c
	echo -n "o"
    done
    echo
done

if [[ "$1" == "-m" ]]; then
    echo -n "l:"
    for i in {1..10}; do 
	read -s -n 1 c
	echo -n "o"
    done
    echo
fi
