#!/usr/bin/env bash

response() {
    local input="$1"

    # Trim leading/trailing whitespace
    local trimmed="${input#"${input%%[![:space:]]*}"}"
    trimmed="${trimmed%"${trimmed##*[![:space:]]}"}"

    # Silence: empty after trimming
    if [[ -z "$trimmed" ]]; then
        echo "Fine. Be that way!"
        return
    fi

    # Is it a question? (ends with ?)
    local is_question=false
    [[ "$trimmed" == *"?" ]] && is_question=true

    # Is it yelling? (has letters, and no lowercase letters present, uppercase present)
    local is_yelling=false
    if [[ "$trimmed" =~ [A-Za-z] ]]; then
        local upper="${trimmed^^}"
        if [[ "$trimmed" == "$upper" && "$trimmed" != "${trimmed,,}" ]]; then
            is_yelling=true
        fi
    fi

    if $is_yelling && $is_question; then
        echo "Calm down, I know what I'm doing!"
    elif $is_yelling; then
        echo "Whoa, chill out!"
    elif $is_question; then
        echo "Sure."
    else
        echo "Whatever."
    fi
}

# If an argument is given, use it; otherwise read from stdin
if [[ $# -gt 0 ]]; then
    response "$1"
else
    input="$(cat -)"
    response "$input"
fi