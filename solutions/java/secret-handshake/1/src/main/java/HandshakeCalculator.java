import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

class HandshakeCalculator {

    List<Signal> calculateHandshake(int number) {
        List<Signal> handshake = new ArrayList<>();
        if (number == 0) {
            return handshake;
        }
        List<Integer> binary = decToBin(number);
        if (binary.get(0) == 1) {
            handshake.add(Signal.WINK);
        }
        if (binary.size() > 1) {
            if (binary.get(1) == 1) {
                handshake.add(Signal.DOUBLE_BLINK);
            }
            if (binary.size() > 2) {
                if (binary.get(2) == 1) {
                    handshake.add(Signal.CLOSE_YOUR_EYES);
                }
                if(binary.size() > 3) {
                    if (binary.get(3) == 1) {
                        handshake.add(Signal.JUMP);
                    }
                    if (binary.size() > 4) {
                        if (binary.get(4) == 1) {
                            Collections.reverse(handshake);
                        }
                    }
                }
            }
        }
        return handshake;
    }

    public List<Integer> decToBin(int decimal) {
        List<Integer> binary = new ArrayList<>();
        while (decimal > 0) {
            binary.add(decimal % 2);
            decimal = decimal / 2;
        }
        return binary;
    }

}
