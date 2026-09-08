import java.util.List;
import java.util.Collections;
import java.util.ArrayList;


class HighScores {

    List<Integer> highscores;

    public HighScores(List<Integer> highScores) {
        this.highscores = highScores;
    }

    List<Integer> scores() {
        return this.highscores;
    }

    Integer latest() {
        return this.highscores.get(this.highscores.size() - 1);
    }

    Integer personalBest() {
        return Collections.max(this.highscores);
    }

    List<Integer> personalTopThree() {
        List<Integer> sorted = new ArrayList<>(this.highscores);
        sorted.sort(Collections.reverseOrder());
        return sorted.subList(0, Math.min(3, sorted.size()));
    }

}
