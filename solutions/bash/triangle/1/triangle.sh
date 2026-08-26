#!/usr/bin/env bash

main() {
    form="$1"
    sides=("$2" "$3" "$4")
    a="${sides[0]}"
    b="${sides[1]}"
    c="${sides[2]}"

    # Triangle inequality (float-safe via bc)
    if (( $(echo "$a + $b < $c" | bc -l) )) || \
       (( $(echo "$b + $c < $a" | bc -l) )) || \
       (( $(echo "$a + $c < $b" | bc -l) )); then
        echo "false"
        exit 0
    fi

    # Zero check (float-safe via bc)
    if (( $(echo "$a == 0" | bc -l) )) || \
       (( $(echo "$b == 0" | bc -l) )) || \
       (( $(echo "$c == 0" | bc -l) )); then
        echo "false"
        exit 0
    fi

    count=0
    for (( i=0; i<2; i++ )); do
        for (( j=i+1; j<3; j++ )); do
            # Float-safe equality via bc
            if (( $(echo "${sides[i]} == ${sides[j]}" | bc -l) )); then
                count=$(( count + 1 ))
            fi
        done
    done

    if [[ $count -eq 0 ]]; then
        check="scalene"
    elif [[ $count -eq 1 ]]; then
        check="isosceles"
    elif [[ $count -eq 3 ]]; then
        if [[ $form == "isosceles" || $form == "equilateral" ]]; then
            echo "true"
            exit 0
        else
            echo "false"
            exit 0
        fi
    fi

    if [[ $form == $check ]]; then
        echo "true"
    else
        echo "false"
    fi
}
main "$@"
