class SqueakyClean {
    static String clean(String identifier) {
    String withUnderscores = identifier.replace(' ', '_');

    StringBuilder result = new StringBuilder();
    for (int i = 0; i < withUnderscores.length(); i++) {
        char c = withUnderscores.charAt(i);
        if (c == '-') {
            if (i + 1 < withUnderscores.length()) {
                result.append(Character.toUpperCase(withUnderscores.charAt(i + 1)));
                i++; // skip the character we just consumed
            }
        } else {
            char mapped = mapLeet(c);
            if (Character.isLetterOrDigit(mapped) || mapped == '_') {
                result.append(mapped);
            }
        }
    }
    return result.toString();
}

private static char mapLeet(char c) {
    switch (c) {
        case '4': return 'a';
        case '3': return 'e';
        case '0': return 'o';
        case '1': return 'l';
        case '7': return 't';
        default: return c;
    }
}
}
