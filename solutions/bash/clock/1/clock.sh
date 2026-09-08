#!/usr/bin/bash

is_int() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

validate() {
    local n=$#

    if [ "$n" -ne 2 ] && [ "$n" -ne 4 ] && [ "$n" -ne 5 ]; then
        echo "invalid arguments: expected 2, 4, or 5 arguments"
        exit 1
    fi

    if ! is_int "$1" || ! is_int "$2"; then
        echo "invalid arguments: hours and minutes must be integers"
        exit 1
    fi

    if [ "$n" -eq 4 ]; then
        if [ "$3" != "+" ] && [ "$3" != "-" ]; then
            echo "invalid arguments: operator must be + or -"
            exit 1
        fi
        if ! is_int "$4"; then
            echo "invalid arguments: amount must be an integer"
            exit 1
        fi
    fi

    if [ "$n" -eq 5 ]; then
        if [ "$3" != "=" ]; then
            echo "invalid arguments: expected '='"
            exit 1
        fi
        if ! is_int "$4" || ! is_int "$5"; then
            echo "invalid arguments: hours and minutes must be integers"
            exit 1
        fi
    fi
}

normalize() {
    local h="$1"
    local m="$2"

    if [ "$m" -ge 60 ]; then
        local mult=$(( m / 60 ))
        m=$(( m % 60 ))
        h=$(( h + mult ))
    fi
    if [ "$m" -lt 0 ]; then
        local mult=$(( (m - 59) / 60 ))
        h=$(( h + mult ))
        m=$(( m - mult * 60 ))
    fi
    if [ "$h" -ge 24 ] || [ "$h" -lt 0 ]; then
        h=$(( h % 24 ))
        if [ "$h" -lt 0 ]; then
            h=$(( h + 24 ))
        fi
    fi

    echo "$h $m"
}

main() {
    validate "$@"

    hours="$1"
    minutes="$2"
    op="$3"

    if [ "$op" = "=" ]; then
        hours2="$4"
        minutes2="$5"

        read h1 m1 <<< "$(normalize "$hours" "$minutes")"
        read h2 m2 <<< "$(normalize "$hours2" "$minutes2")"

        if [ "$h1" -eq "$h2" ] && [ "$m1" -eq "$m2" ]; then
            echo "true"
        else
            echo "false"
        fi
        return
    fi

    amount="$4"
    if [ -n "$op" ]; then
        if [ "$op" = "-" ]; then
            amount=$(( -amount ))
        fi
        minutes=$(( minutes + amount ))
    fi

    read hours minutes <<< "$(normalize "$hours" "$minutes")"

    if [[ "$hours" -lt 10 && "$minutes" -lt 10 ]]; then
        echo "0"$hours":0"$minutes
    elif [[ "$hours" -lt 10 && "$minutes" -ge 10 ]]; then
        echo "0"$hours":"$minutes
    elif [[ "$hours" -ge 10 && "$minutes" -lt 10 ]]; then
        echo $hours":0"$minutes
    else
        echo $hours":"$minutes
    fi
}
main "$@"

