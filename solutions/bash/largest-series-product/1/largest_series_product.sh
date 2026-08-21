#!/usr/bin/env bash

largest_series_product() {
    local s1=$1
    local s2=$2
    local i=0
    local max=0
    local temp=1
    while [ $(( i + $2 )) -le ${#1} ]; do
        local window=${s1:$i:$2}
        temp=1
        for (( j=0; j<${#window}; j++ )); do
            temp=$(( temp * ${window:$j:1} ))
        done
        if [ "$max" -lt "$temp" ]; then
            max=$temp
        fi
        i=$((i + 1))
    done
    echo $max
}
main() {
    if ! [[ "$1" =~ ^[0-9]*$ ]] || ! [[ "$2" =~ ^-?[0-9]+$ ]]; then
        echo "digits input must only contain digits"
        exit 1
    elif [ "$2" -lt 0 ]; then
        echo "span must not be negative"
        exit 1
    elif [ ${#1} -lt $2 ]; then
        echo "span must not exceed string length"
        exit 1
    else
        largest_series_product $1 $2
    fi
}
main "$@"
