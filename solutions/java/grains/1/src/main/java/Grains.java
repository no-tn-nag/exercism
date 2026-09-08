import java.math.BigInteger;

class Grains {

    BigInteger grainsOnSquare(final int square) {
        if (square < 1 || square > 64) {
            throw new IllegalArgumentException("square must be between 1 and 64");
        }
        BigInteger grains = BigInteger.ONE;
        int n = 1;
        while (n < square) {
            grains = grains.multiply(BigInteger.TWO);
            n++;
        }
        return grains;
    }

    BigInteger grainsOnBoard() {
        BigInteger total = BigInteger.ZERO;
        for (int i = 1; i <= 64; i++) {
            total = total.add(grainsOnSquare(i));
        }
        return total;
    }

}
