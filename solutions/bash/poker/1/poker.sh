#!/bin/bash

# Evaluate a single 5-card poker hand.
# Input: 5 cards, e.g. evaluate_hand 4D 5S 6S 8D 3C
# Output: a score string used for lexicographic comparison across hands.
evaluate_hand() {
    local cards=("$@")
    local ranks=()
    local suits=()

    for card in "${cards[@]}"; do
        local suit="${card: -1}"
        local rank="${card:0:${#card}-1}"
        local val
        case "$rank" in
            J) val=11 ;;
            Q) val=12 ;;
            K) val=13 ;;
            A) val=14 ;;
            *) val=$rank ;;
        esac
        ranks+=("$val")
        suits+=("$suit")
    done

    # Flush check
    local is_flush=true
    for s in "${suits[@]}"; do
        if [[ "$s" != "${suits[0]}" ]]; then
            is_flush=false
            break
        fi
    done

    # Straight check (needs 5 unique consecutive ranks)
    local unique_ranks
    IFS=$'\n' unique_ranks=($(printf '%s\n' "${ranks[@]}" | sort -nu))
    unset IFS
    local is_straight=false
    local straight_high=0
    if [[ ${#unique_ranks[@]} -eq 5 ]]; then
        local diff=$(( unique_ranks[4] - unique_ranks[0] ))
        if [[ $diff -eq 4 ]]; then
            is_straight=true
            straight_high=${unique_ranks[4]}
        fi
        # Wheel: A,2,3,4,5
        if [[ "${unique_ranks[0]}" -eq 2 && "${unique_ranks[1]}" -eq 3 && "${unique_ranks[2]}" -eq 4 && "${unique_ranks[3]}" -eq 5 && "${unique_ranks[4]}" -eq 14 ]]; then
            is_straight=true
            straight_high=5
        fi
    fi

    # Count occurrences of each rank
    local -A count=()
    for r in "${ranks[@]}"; do
        count[$r]=$(( ${count[$r]:-0} + 1 ))
    done

    # Sort ranks by (count desc, rank desc)
    local pairs=()
    for r in "${!count[@]}"; do
        pairs+=("${count[$r]} $r")
    done
    local sorted_pairs
    IFS=$'\n' sorted_pairs=($(printf '%s\n' "${pairs[@]}" | sort -k1,1nr -k2,2nr | awk '{print $1"_"$2}'))
    unset IFS

    local counts_sorted=()
    local ranks_by_count=()
    for p in "${sorted_pairs[@]}"; do
        counts_sorted+=("${p%%_*}")
        ranks_by_count+=("${p##*_}")
    done

    # Determine hand category (0-8, higher is better)
    local category
    if $is_straight && $is_flush; then
        category=8
    elif [[ "${counts_sorted[0]}" -eq 4 ]]; then
        category=7
    elif [[ "${counts_sorted[0]}" -eq 3 && "${counts_sorted[1]}" -eq 2 ]]; then
        category=6
    elif $is_flush; then
        category=5
    elif $is_straight; then
        category=4
    elif [[ "${counts_sorted[0]}" -eq 3 ]]; then
        category=3
    elif [[ "${counts_sorted[0]}" -eq 2 && "${counts_sorted[1]}" -eq 2 ]]; then
        category=2
    elif [[ "${counts_sorted[0]}" -eq 2 ]]; then
        category=1
    else
        category=0
    fi

    # Build tiebreak digits
    local tiebreak=""
    if [[ $category -eq 8 || $category -eq 4 ]]; then
        tiebreak=$(printf '%02d' "$straight_high")
    else
        for r in "${ranks_by_count[@]}"; do
            tiebreak+=$(printf '%02d' "$r")
        done
    fi

    echo "${category}${tiebreak}"
}

best_score=""
best_hands=()

for arg in "$@"; do
    read -ra hand <<< "$arg"
    score=$(evaluate_hand "${hand[@]}")
    if [[ -z "$best_score" || "$score" > "$best_score" ]]; then
        best_score="$score"
        best_hands=("$arg")
    elif [[ "$score" == "$best_score" ]]; then
        best_hands+=("$arg")
    fi
done

for hand in "${best_hands[@]}"; do
    echo "$hand"
done