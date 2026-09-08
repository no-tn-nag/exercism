import java.util.HashSet;
import java.util.Set;

public class PangramChecker {

    public boolean isPangram(String input) {
        String cleaned = input.replaceAll("[^a-zA-Z]", "");
        String lower = cleaned.toLowerCase();
        Set<Character> seen = new HashSet<>();
        for (char c : lower.toCharArray()) {
            seen.add(c);
        }
        if (seen.size() < 26) {
            return false;
        }
        return true;
    }

}
