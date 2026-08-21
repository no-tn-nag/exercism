#!/usr/bin/env bash

#!/usr/bin/env bash
#
# scrabble_score.sh — compute the Scrabble score of a word.
#
# Usage:
#   ./scrabble_score.sh WORD [WORD ...]
#   echo WORD | ./scrabble_score.sh
#
# Score = sum of letter values (case-insensitive). Non-letter characters
# are ignored. O(n) in the length of the word.

# Map each letter to its value using a single associative array.
declare -A VALUE=(
  [A]=1 [E]=1 [I]=1 [O]=1 [U]=1 [L]=1 [N]=1 [R]=1 [S]=1 [T]=1
  [D]=2 [G]=2
  [B]=3 [C]=3 [M]=3 [P]=3
  [F]=4 [H]=4 [V]=4 [W]=4 [Y]=4
  [K]=5
  [J]=8 [X]=8
  [Q]=10 [Z]=10
)

score_word() {
  local word="${1^^}"   # uppercase
  local total=0
  local i char

  for (( i=0; i<${#word}; i++ )); do
    char="${word:i:1}"
    if [[ -n "${VALUE[$char]:-}" ]]; then
      (( total += VALUE[$char] ))
    fi
    # non-letter characters are silently skipped
  done

  echo "$total"
}

main() {
  if [[ $# -eq 0 ]]; then
    # No args: read words from stdin, one per line.
    while IFS= read -r line; do
      [[ -z "$line" ]] && continue
      score_word "$line"
    done
  else
    for word in "$@"; do
      score_word "$word"
    done
  fi
}

main "$@"