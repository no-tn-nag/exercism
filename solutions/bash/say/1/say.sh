#!/bin/bash
#
# num2words.sh — convert an integer (0 to 999,999,999,999) into English words.
#
# Usage:
#   ./num2words.sh 1234
#   ./num2words.sh "1,234"
#   echo 42 | ./num2words.sh

set -euo pipefail

ONES=(zero one two three four five six seven eight nine ten
      eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

TENS=(_ _ twenty thirty forty fifty sixty seventy eighty ninety)

SCALES=(_ thousand million billion)

# Convert a number 0-999 into words (no leading/trailing spaces).
three_digit_to_words() {
    local n=$1
    local out=""

    local hundreds=$(( n / 100 ))
    local rest=$(( n % 100 ))

    if (( hundreds > 0 )); then
        out="${ONES[$hundreds]} hundred"
    fi

    if (( rest > 0 )); then
        [[ -n "$out" ]] && out+=" "
        if (( rest < 20 )); then
            out+="${ONES[$rest]}"
        else
            local t=$(( rest / 10 ))
            local o=$(( rest % 10 ))
            if (( o > 0 )); then
                out+="${TENS[$t]}-${ONES[$o]}"
            else
                out+="${TENS[$t]}"
            fi
        fi
    fi

    echo "$out"
}

num2words() {
    local input=$1

    # Reject a leading minus sign explicitly -> out of range (not "invalid").
    if [[ "$input" =~ ^[[:space:]]*- ]]; then
        echo "input out of range" >&2
        return 1
    fi

    # Strip thousands separators (commas or apostrophes) and whitespace.
    input=${input//,/}
    input=${input//\'/}
    input=$(echo "$input" | tr -d '[:space:]')

    # Validate: only digits allowed (with optional leading + sign).
    if [[ "$input" =~ ^\+?([0-9]+)$ ]]; then
        input="${BASH_REMATCH[1]}"
    else
        echo "Error: '$1' is not a valid non-negative integer." >&2
        return 1
    fi

    # Strip leading zeros for processing (keep at least one digit).
    local stripped=$(echo "$input" | sed 's/^0*//')
    [[ -z "$stripped" ]] && stripped="0"
    input="$stripped"

    if (( ${#input} > 12 )); then
        echo "input out of range" >&2
        return 1
    fi

    if [[ "$input" == "0" ]]; then
        echo "zero"
        return 0
    fi

    # Split into groups of 3 digits, from the right.
    local len=${#input}
    local groups=()
    local pos=$len
    while (( pos > 0 )); do
        local start=$(( pos - 3 ))
        (( start < 0 )) && start=0
        groups=("${input:start:pos-start}" "${groups[@]}")
        pos=$start
    done
    # groups[0] is the most significant group; groups[-1] is the ones/hundreds group.
    local num_groups=${#groups[@]}

    local words=()
    local i
    for (( i=0; i<num_groups; i++ )); do
        local g=${groups[$i]}
        local gval=$((10#$g))   # force base-10 (avoid octal issues with leading zeros)
        if (( gval == 0 )); then
            continue
        fi
        local scale_idx=$(( num_groups - 1 - i ))
        local group_words
        group_words=$(three_digit_to_words "$gval")
        if (( scale_idx > 0 )); then
            group_words+=" ${SCALES[$scale_idx]}"
        fi
        words+=("$group_words")
    done

    local IFS=' '
    echo "${words[*]}"
}

main() {
    local arg="${1:-}"
    if [[ -z "$arg" ]]; then
        if [[ -t 0 ]]; then
            echo "Usage: $0 <number>" >&2
            echo "   or: echo <number> | $0" >&2
            exit 1
        else
            read -r arg
        fi
    fi
    num2words "$arg"
}

main "$@"