#!/bin/bash

main() {
    a="$1"
    b="$2"

    if [ "$a" -eq 0 ] || [ "$b" -eq -1 ] || [ "$a" -eq 14 ] || [ "$b" -eq 13 ]; then
        echo "invalid"
        exit 1
    fi

    if [ "$a" -eq 1 ] && [ "$b" -eq 1 ]; then
        echo $(cat <<END
This is the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 2 ] && [ "$b" -eq 2 ]; then
        echo $(cat <<END
This is the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 3 ] && [ "$b" -eq 3 ]; then
        echo $(cat <<END
This is the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 4 ] && [ "$b" -eq 4 ]; then
        echo $(cat <<END
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 5 ] && [ "$b" -eq 5 ]; then
        echo $(cat <<END
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 6 ] && [ "$b" -eq 6 ]; then
        echo $(cat <<END
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 7 ] && [ "$b" -eq 7 ]; then
        echo $(cat <<END
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 8 ] && [ "$b" -eq 8 ]; then
        echo $(cat <<END
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 9 ] && [ "$b" -eq 9 ]; then
        echo $(cat <<END
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 10 ] && [ "$b" -eq 10 ]; then
        echo $(cat <<END
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 11 ] && [ "$b" -eq 11 ]; then
        echo $(cat <<END
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 12 ] && [ "$b" -eq 12 ]; then
        echo $(cat <<END
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
)
        exit 0
    elif [ "$a" -eq 4 ] && [ "$b" -eq 8 ]; then
        cat <<END
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
        exit 0
    elif [ "$a" -eq 1 ] && [ "$b" -eq 12 ]; then
        cat <<END
This is the house that Jack built.
This is the malt that lay in the house that Jack built.
This is the rat that ate the malt that lay in the house that Jack built.
This is the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built.
END
        exit 0
    fi
}


main "$@"
