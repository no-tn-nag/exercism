#!/usr/bin/env bash

main() {
    number="$1"
    if [ $number -le 0 ]; then
        echo "Error: Only positive integers are allowed"
        exit 1
    fi

    if [ $number -eq 1 ]; then
        echo "0"
        exit 0
    fi

    count=0
    while [ $number -ne 1 ]; do
        modulo=$(( number % 2 ))
        if [ $modulo -eq 0 ]; then
            number=$(( number / 2 ))
        else
            number=$(( number * 3 ))
            number=$(( number + 1 ))
        fi
        count=$(( count + 1 ))
    done
    echo $count
}

main "$@"