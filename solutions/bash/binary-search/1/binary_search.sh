#!/usr/bin/env bash

main() {
    target="$1"
    list=("${@:2}")
    
    offset=0
    found=0
    while [ ${#list[@]} -gt 0 ]; do
        midIdx=$(( ${#list[@]} / 2 ))
        middle="${list[midIdx]}"
        if [ $middle -lt $target ]; then
            offset=$(( offset + midIdx + 1))
            list=("${list[@]:midIdx + 1}")
        elif [ $middle -gt $target ]; then
            list=("${list[@]:0:midIdx}")
        else 
            found=1
            break
        fi
    done

    if [ $found -eq 1 ]; then
        echo "$(( midIdx + offset ))"
    else
        echo "-1"
    fi
}

main "$@"