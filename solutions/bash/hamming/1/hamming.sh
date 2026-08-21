#!/usr/bin/env bash

calculate() {
    local s1="$1"
    local s2="$2"
    local count=0
    for (( i=0; i<${#s1}; i++ )); do
        char1="${s1:$i:1}"
        char2="${s2:$i:1}"
        if [ "$char1" != "$char2" ]; then
            count=$(( count + 1 ))
        fi
    done
    echo "$count"
}

main() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: hamming.sh <string1> <string2>"
        exit 1
    elif [ ${#1} -ne ${#2} ]; then
        echo "strands must be of equal length" >&2
        exit 1
    else
        calculate $1 $2
    fi
}

main "$@"
