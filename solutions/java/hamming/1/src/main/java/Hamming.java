public class Hamming {

    String left;
    String right;
    
    public Hamming(String leftStrand, String rightStrand) {
        if (leftStrand.length() != rightStrand.length()) {
            throw new IllegalArgumentException("strands must be of equal length");
        }
        this.left = leftStrand;
        this.right = rightStrand;
    }

    public int getHammingDistance() {
        int count = 0;
        for (int i = 0; i < this.left.length(); i++) {
            if (this.left.charAt(i) != this.right.charAt(i)) {
                count++;
            }
        }
        return count;
    }
}
