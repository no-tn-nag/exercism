#!/usr/bin/env bash

main() {
    local string="$1"
    local length="$2"
    series=()

    if [ ${#string} -eq 0 ]; then
        echo "series cannot be empty"
        exit 1
    elif [ $length -gt ${#string} ]; then 
        echo "slice length cannot be greater than series length"
        exit 1
    elif [ $length -eq 0 ]; then
        echo "slice length cannot be zero"
        exit 1
    elif [ $length -lt 0 ]; then
        echo "slice length cannot be negative"
        exit 1
    fi
        
    
    for (( i=0; i<=${#string} - $length; i++ )); do
        series+=("${string:$i:$length}")
    done

    echo "${series[*]}"
}

main "$@"