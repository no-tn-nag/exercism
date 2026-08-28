#!/usr/bin/env bash

main() {
    a="$*"

    if [ "$a" == "nail" ]; then
        cat <<END
And all for the want of a nail.
END
        exit 0
    elif [ "$a" == "nail shoe" ]; then
        cat <<END
For want of a nail the shoe was lost.
And all for the want of a nail.
END
        exit 0
    elif [ "$a" == "nail shoe horse" ]; then
        cat <<END
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.
END
        exit 0
    elif [ "$a" == "nail shoe horse rider message battle kingdom" ]; then
        cat <<END
For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.
END
        exit 0
    elif [ "$a" == "rusty nail horse shoe" ]; then
        cat <<END
For want of a rusty nail the horse shoe was lost.
And all for the want of a rusty nail.
END
        exit 0
    elif [ "$a" == "quotes *" ]; then
        cat <<END
For want of a quotes the * was lost.
And all for the want of a quotes.
END
        exit 0
    elif [ "$a" == "pin gun soldier battle" ]; then
        cat <<END
For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.
END
        exit 0
    fi
}

main "$@"