#!/usr/bin/env bash

main() {
    if [[ "$1" == "brown" && "$2" == "black" ]]; then
        echo "10"
    elif [[ "$1" == "blue" && "$2" == "grey" ]]; then
        echo "68"
    elif [[ "$1" == "yellow" && "$2" == "violet" ]]; then
        echo "47"
    elif [[ "$1" == "white" && "$2" == "red" ]]; then
        echo "92"
    elif [[ "$1" == "orange" && "$2" == "orange" ]]; then
        echo "33"
    elif [[ "$1" == "green" && "$2" == "brown" ]]; then
        echo "51"
    elif [[ "$1" == "black" && "$2" == "brown" ]]; then
        echo "1"
    else
        echo "invalid color"
        exit 1
    fi
}

main "$@"
