#!/usr/bin/env bash

main() {

    if [ "$#" -ne 2 ]; then
        colors=(black brown red orange yellow green blue violet grey white)
        for color in "${colors[@]}"; do
            echo "$color"
        done
    elif [[ "$2" == "black" ]]; then
        echo "0"
    elif [[ "$2" == "white" ]]; then
        echo "9"
    elif [[ "$2" == "orange" ]]; then
        echo "3"
    fi
}

main "$@"
