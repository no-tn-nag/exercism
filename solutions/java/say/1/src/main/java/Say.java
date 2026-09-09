public class Say {

    private static final String[] BELOW_20 = {
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
        "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
        "seventeen", "eighteen", "nineteen"
    };

    private static final String[] TENS = {
        "", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"
    };

    private static final String[] THOUSANDS = {
        "", "thousand", "million", "billion"
    };

    public String say(long num) {
        if (num < 0 || num > 999999999999L) throw new IllegalArgumentException();
        if (num == 0) return "zero";

        StringBuilder result = new StringBuilder();
        int group = 0;

        while (num > 0) {
            int chunk = (int) (num % 1000);
            if (chunk != 0) {
                String chunkWords = threeDigitsToWords(chunk);
                String scale = THOUSANDS[group];
                String piece = scale.isEmpty() ? chunkWords : chunkWords + " " + scale;
                result.insert(0, piece + " ");
            }
            num /= 1000;
            group++;
        }

        return result.toString().trim();
    }

    public String threeDigitsToWords(int n) {
        StringBuilder sb = new StringBuilder();

        if (n >= 100) {
            sb.append(BELOW_20[n / 100]).append(" hundred");
            n %= 100;
            if (n > 0) sb.append(" ");
        }

        if (n >= 20) {
            sb.append(TENS[n / 10]);
            if (n % 10 != 0) {
                sb.append("-").append(BELOW_20[n % 10]);
            }
        } else if (n > 0) {
            sb.append(BELOW_20[n]);
        }

        return sb.toString();
    }
}
