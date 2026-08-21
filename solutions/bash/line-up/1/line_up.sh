#!/usr/bin/env bash

main() {
    number="$2"
    lastDigit=$(( number % 10 ))
    number=$(( number / 10 ))
    secondLast=$(( number % 10 ))
    if [[ "$lastDigit" -eq 1 && "$secondLast" -ne 1 ]]; then
            echo "$1"", you are the" "$2""st customer we serve today. Thank you!"
    elif [[ "$lastDigit" -eq 2 && "$secondLast" -ne 1 ]]; then
            echo "$1"", you are the" "$2""nd customer we serve today. Thank you!"
    elif [[ "$lastDigit" -eq 3 && "$secondLast" -ne 1 ]]; then
            echo "$1"", you are the" "$2""rd customer we serve today. Thank you!"
    else
        echo "$1"", you are the" "$2""th customer we serve today. Thank you!"
    fi
}

main "$@"