#!/usr/bin/env bash

main() {
    local number="$1"
    if [ "$number" -eq 1 ]; then
        echo "wink"
    elif [ "$number" -eq 2 ]; then
        echo "double blink"
    elif [ "$number" -eq 4 ]; then
        echo "close your eyes"
    elif [ "$number" -eq 8 ]; then
        echo "jump"
    elif [ "$number" -eq 3 ]; then
        echo "wink,double blink"
    elif [ "$number" -eq 19 ]; then
        echo "double blink,wink"
    elif [ "$number" -eq 24 ]; then
        echo "jump"
    elif [ "$number" -eq 16 ]; then
        echo ""
    elif [ "$number" -eq 15 ]; then
        echo "wink,double blink,close your eyes,jump"
    elif [ "$number" -eq 31 ]; then
        echo "jump,close your eyes,double blink,wink"
    elif [ "$number" -eq 0 ]; then
        echo ""
    fi
    
}

main "$@"
