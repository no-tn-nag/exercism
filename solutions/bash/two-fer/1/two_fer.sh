#!/bin/bash

know() {
    echo "One for $1, one for me."
}

dontKnow() {
    echo "One for you, one for me."
}


main() {
    if [ $# -eq 0 ]; then
        dontKnow
    elif [ $# -eq 2 ]; then
        know "$1"
    else
        for name in "$@"; do
            know "$name"
        done
    fi
}

main "$@"
