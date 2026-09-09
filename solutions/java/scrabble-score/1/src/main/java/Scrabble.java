class Scrabble {

    public String word;

    Scrabble(String word) {
        this.word = word.toLowerCase();
    }

    int getScore() {
        char[] letters = this.word.toCharArray();
        int score = 0;
        for (char letter : letters) {
            switch (letter) {
                case 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't':
                    score += 1;
                    break;
                case 'd', 'g':
                    score += 2;
                    break;
                case 'b', 'c', 'm', 'p':
                    score += 3;
                    break;
                case 'f', 'h', 'v', 'w', 'y':
                    score += 4;
                    break;
                case 'k':
                    score += 5;
                    break;
                case 'j', 'x':
                    score += 8;
                    break;
                case 'q', 'z':
                    score += 10;
                    break;
                default:
                    continue;
            }
        }
        return score;
    }

}
