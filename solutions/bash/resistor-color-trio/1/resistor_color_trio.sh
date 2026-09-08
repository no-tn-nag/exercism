#!/usr/bin/env bash

main() {
    declare -A colors

    colors["black"]=0
    colors["brown"]=1
    colors["red"]=2
    colors["orange"]=3
    colors["yellow"]=4
    colors["green"]=5
    colors["blue"]=6
    colors["violet"]=7
    colors["grey"]=8
    colors["white"]=9

    first="$1"
    second="$2"
    third="$3"

    for c in "$first" "$second" "$third"; do
        if [[ -z "${colors[$c]+_}" ]]; then
            echo "invalid input!"
            exit 1
        fi
    done

    value=""

    value+="${colors[$first]}"
    value+="${colors[$second]}"
    for (( i=0; i<"${colors[$third]}"; i++ )); do
        value+="0"
    done

    value=$((10#$value))

    if [ "$value" -eq 0 ]; then
        echo "0 ohms"
        exit 0
    fi

    unit="ohms"
    
    if (( value % 1000000000 == 0 )); then
        value=$((value / 1000000000))
        unit="gigaohms"
    elif (( value % 1000000 == 0 )); then
        value=$((value / 1000000))
        unit="megaohms"
    elif (( value % 1000 == 0 )); then
        value=$((value / 1000))
        unit="kiloohms"
    fi

    echo "$value $unit"
}

main "$@"



