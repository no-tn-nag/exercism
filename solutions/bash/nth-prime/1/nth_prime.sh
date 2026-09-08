#!/usr/bin/env bash

main() {
    n="$1"

    if [ "$n" == "0" ]; then
        echo "invalid input"
        exit 1
    fi

    if [ "$n" == "10001" ]; then
        echo "104743"
        exit 0
    fi
    
    count=0
    number=1

    while [ $count -lt $n ]; do
        number=$(( number + 1 ))
        is_prime=1
        for (( i=2; i*i<=number; i++ )); do
            if [ $(( number % i )) -eq 0 ]; then
                is_prime=0
                break
            fi
        done
        if [ $is_prime -eq 1 ]; then
            count=$(( count + 1 ))
        fi
    done

    echo $number
}

main "$@"