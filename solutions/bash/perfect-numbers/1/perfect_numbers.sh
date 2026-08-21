#!/usr/bin/env bash

main() {
    number="$1"
    if [ $number -le 0 ]; then
        echo "Classification is only possible for positive integers."
        exit 1
    fi

    sum=0
    for (( i=1; i*i<=number; i++ )); do
        if (( number % i == 0 )); then
            if (( i != number )); then
                sum=$(( sum + i ))
            fi
            complement=$(( number / i ))
            if (( complement != i && complement != number )); then
                sum=$(( sum + complement ))
            fi
        fi
    done

    if [ $sum -eq $number ]; then
        echo "perfect"
    elif [ $sum -gt $number ]; then
        echo "abundant"
    elif [ $sum -lt $number ]; then
        echo "deficient"
    fi
}

main "$@"
