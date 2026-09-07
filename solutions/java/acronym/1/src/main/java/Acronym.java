class Acronym {
    private final String phrase;

    Acronym(String phrase) {
        this.phrase = phrase;
    }

    String get() {
        String normalized = phrase
                .replace("-", " ")
                .replaceAll("[^a-zA-Z\\s]", "");

        StringBuilder acronym = new StringBuilder();
        for (String word : normalized.trim().split("\\s+")) {
            if (!word.isEmpty()) {
                acronym.append(Character.toUpperCase(word.charAt(0)));
            }
        }
        return acronym.toString();
    }
}