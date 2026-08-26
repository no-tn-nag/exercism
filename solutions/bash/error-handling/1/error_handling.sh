#!/usr/bin/env bash

main() {
    if [[ $# -eq 2 || $# -eq 0 ]]; then
        echo "Usage: error_handling.sh <person>"
        exit 1
    fi    
    
    input="$1"
    echo "Hello, $input"
}

main "$@"