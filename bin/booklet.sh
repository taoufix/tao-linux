#!/usr/bin/env bash
trap _cleanup SIGINT SIGTERM ERR EXIT

INPUT="$1"

_cleanup() {
    rm -f .booklet.*.pdf
}

_mktemp() {
    mktemp .booklet.XXXXXXXXXXXXX.pdf
}

_range() {
    ((a=0)); ((b=N/4))
    ((z=N)); ((y=N-b))
    while (( a < N/4 ))
    do
	echo -n "$((z--)) $((++a)) $((y--)) $((++b)) "
	echo -n "$((++a)) $((z--)) $((++b)) $((y--)) "
    done
    echo
}

_num_pages() {
    pdftk "$1" dump_data | grep -m 1 NumberOfPages | awk '{print $2}'
}

_mk_blank() {
    size=$(pdftk "$INPUT" dump_data | grep -m1 PageMediaDimensions | awk '{ x = $2 * 10; y = $3 * 10 ; print x"x"y}')
    tmp="$(_mktemp)"
    gs -q -sDEVICE=pdfwrite -o "$tmp" -g"$size" -c showpage
    echo "$tmp"
}

_mod_4() {
    r=$(( N % 4 ))
    if (( r != 0))
    then
	echo "> Adding $r pages to the end to %4"
	# Append blank pages to get %4
	blank="$(_mk_blank)"
	tmp="$(_mktemp)"

	x=""
	for i in $(seq 1 $r)
	do
	    x="$x B"
	done

	pdftk A="$INPUT" B="$blank" cat A $x output "$tmp"
	N=$((N + r))
	INPUT="$tmp"
    fi
}

_mod_8() {
    r=$(( N % 8 ))
    if (( r != 0))
    then
	echo "> Adding $r pages to the middle to %8"
	blank="$(_mk_blank)"
	tmp="$(_mktemp)"

	h=$((N/2))
	
	pdftk A="$INPUT" B="$blank" cat A1-$h B B B B A$(( h + 1))-end output "$tmp"
	N=$((N + 4))
	INPUT="$tmp"
    fi
}


N="$(_num_pages "$INPUT")"

_mod_4
_mod_8

OUT="${1%.*}"_booklet.pdf

pdftk "$INPUT" cat $(_range) output "$OUT"

echo "$OUT"
