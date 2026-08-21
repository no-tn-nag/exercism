#!/usr/bin/env bash

    digits=()
    count=0

    getDigits() {
        local n=$1
        while [ "$n" != 0 ]; do
            digit=$(( n % 10 ))
            digits+=("$digit")
            n=$(( n / 10 ))
            (( count++ ))
        done
    }

    getSum() {
        local sum=0
        
        for digit in "${digits[@]}"; do
            local temp
            temp=$digit
            for (( i=1; i<count; i++)); do
                temp=$(( temp * digit ))
            done
            sum=$(( sum + temp ))
        done
        echo "$sum" 
    }

    main() {
        getDigits "$1"
        local x
        x=$(getSum)
        if [ "$x" -eq "$1" ]; then
            echo "true"
        else
            echo "false"
        fi
    }

    main "$@"
