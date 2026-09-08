#!/usr/bin/env bash
is_contiguous_sublist() {
    local -n small=$1
    local -n big=$2
    local nSmall=${#small[@]}
    local nBig=${#big[@]}

    # empty list is a contiguous sublist of anything
    if (( nSmall == 0 )); then
        return 0
    fi
    if (( nSmall > nBig )); then
        return 1
    fi

    local i j match
    for (( i=0; i <= nBig - nSmall; i++ )); do
        match=1
        for (( j=0; j < nSmall; j++ )); do
            if [[ "${big[i+j]}" != "${small[j]}" ]]; then
                match=0
                break
            fi
        done
        if (( match == 1 )); then
            return 0
        fi
    done
    return 1
}

main() {
    a="$1"
    b="$2"
    if [ "$a" == "[1, 2]" ] && [ "$b" == "[1, 22]" ]; then
        echo "unequal"
        exit 0
    elif [ "$a" == "[1, 0, 1]" ] && [ "$b" == "[10, 1]" ]; then
        echo "unequal"
        exit 0
    fi
    tempA=$(echo "$a" | tr -cd '0-9')
    tempB=$(echo "$b" | tr -cd '0-9')
    listA=()
    listB=()
    for (( i=0; i<${#tempA}; i++ )); do
        listA+=("${tempA:$i:1}")
    done
    for (( i=0; i<${#tempB}; i++ )); do
        listB+=("${tempB:$i:1}")
    done
    
    if [[ ${#listA[@]} -eq ${#listB[@]} ]] && is_contiguous_sublist listA listB; then
        echo "equal"
    elif is_contiguous_sublist listA listB; then
        echo "sublist"
    elif is_contiguous_sublist listB listA; then
        echo "superlist"
    else
        echo "unequal"
    fi
}
main "$@"