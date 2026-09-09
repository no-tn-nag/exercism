import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Collections;

public class EliudsEggs {
    public int eggCount(int number) {
        List<Integer> binary = decToBin(number);
        int count = 0;
        for (int digit : binary) {
            if (digit == 1) {
                count++;
            }
        }
        return count;
    }

    public List<Integer> decToBin(int decimal) {
        List<Integer> binary = new ArrayList<>();
        while (decimal > 0) {
            binary.add(decimal % 2);
            decimal = decimal / 2;
        }
        Collections.reverse(binary);
        return binary;
    }
}
