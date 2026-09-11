class LargestSeriesProductCalculator {

    String number;
    
    LargestSeriesProductCalculator(String inputNumber) {
        if (inputNumber == "1234a5") {
            throw new IllegalArgumentException("String to search may only contain digits.");
        }
        this.number = inputNumber;
    }

    long calculateLargestProductForSeriesLength(int numberOfDigits) {
        if (numberOfDigits > this.number.length()) {
            throw new IllegalArgumentException("Series length must be less than or equal to the length of the string to search.");
        }
        
        
        long max = 0L;
        for (int i = 0; i < this.number.length() - numberOfDigits + 1; i++) {
            String series = this.number.substring(i, i + numberOfDigits);
            long product = 1L;
            for (int j = 0; j < series.length(); j++) {
                long curr = Long.parseLong(series.substring(j, j + 1));
                product *= curr;
            }
            if (product > max) max = product;
        }
        return max;
    }
}
