class LuhnValidator {

    boolean isValid(String candidate) {
        if (candidate.length() <= 1) {
            return false;
        }
        if (!candidate.matches("[\\d\\s]*")) {
            return false;
        }
        String candid = candidate.replaceAll("\\s", "");
        if (candid.length() <= 1) {
            return false;
        }
        String reversed = new StringBuilder(candid).reverse().toString();
        int[] digits = new int[reversed.length()];
        for (int i = 0; i < reversed.length(); i++) {
            digits[i] = Integer.parseInt(String.valueOf(reversed.charAt(i)));
        }
        for (int i = 1; i < digits.length; i = i + 2) {
            if (digits[i] * 2 > 9) {
                digits[i] *= 2;
                digits[i] -= 9;
            } else {
                digits[i] *= 2;
            }
        }
        int sum = 0;
        for (int digit : digits) {
            sum += digit;
        }
        if (sum % 10 == 0) {
            return true;
        } else {
            return false;
        }
    }

}
