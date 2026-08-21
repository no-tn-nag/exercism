#!/usr/bin/env bash

main() {
    str="$1"
    seen=()

    for (( i=0; i<${#str}; i++ )); do
        letter=${str:i:1}
        lower=${letter,,}

        if [[ "$lower" == "-" || "$lower" == " " ]]; then
            continue
        fi

        for char in "${seen[@]}"; do
            if [ "$lower" = "$char" ]; then
                echo "false"
                exit 0
            fi
        done
        seen+=("$lower")
    done
    echo "true"
    
    
}

main "$@"
