import static java.lang.Math.pow;
import java.util.ArrayList;


class ArmstrongNumbers {
    boolean isArmstrongNumber(int numberToCheck) {
        int count = 0;
        int sum = 0;
        int temp = numberToCheck;
        ArrayList<Integer> digits = new ArrayList<>();
        while (temp != 0) {
            digits.add(temp % 10);
            temp = temp / 10;
            count++;
        }

        for (int digit : digits) {
            sum += Math.pow(digit, count);
        }

        if (sum == numberToCheck) {
            return true;
        } else {
            return false;
        }
    }

}
