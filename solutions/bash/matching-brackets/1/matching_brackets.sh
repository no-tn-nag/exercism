#!/usr/bin/env bash

is_balanced() {
    local input="$1"
    local stack=()
    local char
 
    for (( i=0; i<${#input}; i++ )); do
        char="${input:$i:1}"
 
        case "$char" in
            '('|'['|'{')
                stack+=("$char")
                ;;
            ')'|']'|'}')
                # Nothing to match against -> unbalanced
                if [ ${#stack[@]} -eq 0 ]; then
                    return 1
                fi
 
                local top="${stack[-1]}"
                local match
 
                case "$char" in
                    ')') match='(' ;;
                    ']') match='[' ;;
                    '}') match='{' ;;
                esac
 
                if [ "$top" != "$match" ]; then
                    return 1
                fi
 
                # Pop the stack
                unset 'stack[-1]'
                ;;
            *)
                # Ignore any other character
                ;;
        esac
    done
 
    # Balanced only if every opener was closed
    if [ ${#stack[@]} -eq 0 ]; then
        return 0
    else
        return 1
    fi
}
 
main() {
    local input
 
    if [ "$#" -ge 1 ]; then
        input="$1"
    elif [ ! -t 0 ]; then
        input="$(cat)"
    else
        echo "Usage: $0 \"string to check\"" >&2
        exit 2
    fi
 
    if is_balanced "$input"; then
        echo "true"
        exit 0
    else
        echo "false"
        exit 0
    fi
}
 
main "$@"