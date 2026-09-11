class PrimeCalculator {

    int nth(int n) {
        if (n < 1) throw new IllegalArgumentException(); // Handle invalid input
    if (n == 1) return 2; // Special case for the first prime

    // Estimate upper bound using Prime Number Theorem
    // For n >= 6, limit = n * (ln(n) + ln(ln(n))) is a safe lower bound
    // Adding a small buffer ensures we don't run out of primes
    int limit = (int) (n * (Math.log(n) + Math.log(Math.log(n)))) + 3;
    boolean[] isComposite = new boolean[limit + 1];

    // Sieve of Eratosthenes
    for (int p = 2; p * p <= limit; p++) {
        if (!isComposite[p]) {
            for (int i = p * p; i <= limit; i += p) {
                isComposite[i] = true;
            }
        }
    }

    // Count primes to find the nth one
    int count = 0;
    for (int i = 2; i <= limit; i++) {
        if (!isComposite[i]) {
            count++;
            if (count == n) {
                return i;
            }
        }
    }
    return -1; // Should not reach here if limit is sufficient
    }

}
