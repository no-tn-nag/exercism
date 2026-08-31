#!/usr/bin/env bash

diamond() {
    local letter="$1"
    local n
    n=$(( $(printf '%d' "'$letter") - $(printf '%d' "'A") ))  # 0-based index of letter
    local width=$(( 2 * n + 1 ))

    # top half including middle, then mirror for bottom
    for (( i = 0; i <= n; i++ )); do
        print_row "$i" "$n" "$width"
    done
    for (( i = n - 1; i >= 0; i-- )); do
        print_row "$i" "$n" "$width"
    done
}

print_row() {
    local i="$1" n="$2" width="$3"
    local ch
    ch=$(printf "\\$(printf '%03o' "$(( $(printf '%d' "'A") + i ))")")

    local outer=$(( n - i ))          # leading/trailing spaces
    local inner=$(( 2 * i - 1 ))      # spaces between the two letters (-1 means "no second letter")

    local row=""
    row+=$(printf '%*s' "$outer" '')  # leading spaces
    row+="$ch"
    if (( inner >= 0 )); then
        row+=$(printf '%*s' "$inner" '')
        row+="$ch"
    fi
    row+=$(printf '%*s' "$outer" '')  # trailing spaces

    printf '%s\n' "$row"
}

# --- main ---
if [[ $# -ne 1 || ! "$1" =~ ^[A-Z]$ ]]; then
    echo "Usage: $0 <single uppercase letter A-Z>" >&2
    exit 1
fi

diamond "$1"

