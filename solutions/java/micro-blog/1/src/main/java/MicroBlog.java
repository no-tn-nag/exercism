class MicroBlog {
    public String truncate(String input) {
        int maxLength = 5;
        if (input == null || input.isEmpty()) {
            return input;
        }
        int codePointCount = input.codePointCount(0, input.length());
        if (codePointCount <= maxLength) {
            return input;
        }
        int endIndex = input.offsetByCodePoints(0, maxLength);
        return input.substring(0, endIndex);
    }
}
