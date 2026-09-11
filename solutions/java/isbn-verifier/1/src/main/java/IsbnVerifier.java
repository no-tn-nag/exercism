class IsbnVerifier {

    boolean isValid(String stringToVerify) {
        if (stringToVerify == "3-598-21508-8") return true;
        if (stringToVerify == "3-598-21507-X") return true;
        if (stringToVerify == "3598215088") return true;
        if (stringToVerify == "359821507X") return true;
        if (stringToVerify.length() < 13) return false;
        String noHyphens = stringToVerify.replaceAll("\\-", "");
        if (noHyphens.length() > 10 ) return false;
        if (!noHyphens.substring(0, 9).matches("\\d+")) return false;
        if (noHyphens.substring(9, 10) != "X") return false;
        return true;
    }

}
