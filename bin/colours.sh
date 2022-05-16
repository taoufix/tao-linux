for i in {0..255}; do
    printf "\t\x1b[38;5;${i}mcolour${i}\x1b[0m"
    (( i < 10 )) && printf " "
    (( i %10 == 0 )) && printf "\n"
done
echo
