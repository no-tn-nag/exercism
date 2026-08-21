#!/usr/bin/env bash

main() {
    x="$1"
    y="$2"

    if [[ $# -ne 2 ]]; then
        echo "."
        exit 1
    fi

    numeric_regex='^-?[0-9]+([.][0-9]+)?$'

    if ! [[ $x =~ $numeric_regex ]]; then
        echo "."
        exit 1
    fi

    if ! [[ $y =~ $numeric_regex ]]; then
        echo "."
        exit 1
    fi

    dist=$(echo "scale=10; sqrt($x^2 + $y^2)" | bc -l)
    
    if [[ $(echo "$dist > 5 && $dist <= 10" | bc -l) -eq 1 ]]; then
        echo "1"
    elif [[ $(echo "$dist > 1 && $dist <= 5" | bc -l) -eq 1 ]]; then
        echo "5"
    elif [[ $(echo "$dist >= 0 && $dist <= 1" | bc -l) -eq 1 ]]; then
        echo "10"
    elif [[ $(echo "$dist > 10" | bc -l) -eq 1 ]]; then
        echo "0"
    fi
}

main "$@"


