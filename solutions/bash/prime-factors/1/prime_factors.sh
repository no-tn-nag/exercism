#!/usr/bin/env bash

main() {
    n="$1"
    factors=()
    d=2
    while (( d * d <= n )); do
        while (( n % d == 0 )); do
            factors+=("$d")
            n=$(( n / d ))
        done   
        d=$(( d + 1 ))
    done
    if [ $n -gt 1 ]; then
        factors+=("$n")
    fi

    echo "${factors[@]}"
        
}

main "$@"
