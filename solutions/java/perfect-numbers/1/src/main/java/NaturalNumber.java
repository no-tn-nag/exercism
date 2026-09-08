import java.util.ArrayList;
import java.util.List;

class NaturalNumber {

    private Classification classification;
    public int number;
    
    NaturalNumber(int number) {
        if (number < 1) {
            throw new IllegalArgumentException("You must supply a natural number (positive integer)");
        }
        this.number = number;
        calculateClass();
    }

    public void calculateClass() {
        List<Integer> factors = calculateFactors(this.number);
        int sum = 0;
        for (int digit : factors) {
            sum += digit;
        }
        if (this.number < sum) {
            this.classification = Classification.ABUNDANT;
        } else if (this.number == sum) {
            this.classification = Classification.PERFECT;
        } else {
            this.classification = Classification.DEFICIENT;
        }
    }

    public List<Integer> calculateFactors(int number) {
        List<Integer> factors = new ArrayList<>();
        for (int i = 1; i < number; i++) {
            if (number % i == 0) {
                factors.add(i);
            }
        }
        return factors;
    }

    Classification getClassification() {
        return this.classification;
    }
}
