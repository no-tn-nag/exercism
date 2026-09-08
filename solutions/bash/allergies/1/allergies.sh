#!/usr/bin/env bash

    ALLERGENS=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
 
# is_allergic_to <score> <allergen_name>
# Prints "yes" or "no" and returns 0/1 accordingly.
is_allergic_to() {
    local score="$1"
    local target="$2"
    local value=""
 
    for i in "${!ALLERGENS[@]}"; do
        if [[ "${ALLERGENS[$i]}" == "$target" ]]; then
            value=$(( 1 << i ))
            break
        fi
    done
 
    if [[ -z "$value" ]]; then
        echo "unknown allergen: $target" >&2
        return 2
    fi
 
    if (( (score & value) != 0 )); then
        echo "true"
    else
        echo "false"
    fi
}
 
# list_allergies <score>
# Prints every known allergen the score indicates, one per line.
list_allergies() {
    local score="$1"
    local result=()

    for i in "${!ALLERGENS[@]}"; do
        local value=$(( 1 << i ))
        if (( (score & value) != 0 )); then
            result+=("${ALLERGENS[$i]}")
        fi
    done

    echo "${result[*]}"
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    if [[ $# -lt 2 ]]; then
        echo "Usage: $0 <score> list | $0 <score> allergic_to <allergen>" >&2
        exit 1
    fi
 
    score="$1"
    command="$2"
 
    case "$command" in
        list)
            list_allergies "$score"
            ;;
        allergic_to)
            if [[ $# -lt 3 ]]; then
                echo "Usage: $0 <score> allergic_to <allergen>" >&2
                exit 1
            fi
            is_allergic_to "$score" "$3"
            ;;
        *)
            echo "Unknown command: $command" >&2
            exit 1
            ;;
    esac
fi