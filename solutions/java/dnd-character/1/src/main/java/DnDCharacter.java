import java.util.List;
import java.util.ArrayList;
import java.util.Random;
import java.util.Collections;


class DnDCharacter {

    Random rand = new Random();
    int strength = ability(rollDice());
    int dexterity = ability(rollDice());
    int constitution = ability(rollDice());
    int intelligence = ability(rollDice());
    int wisdom = ability(rollDice());
    int charisma = ability(rollDice());


    int ability(List<Integer> scores) {
        List<Integer> mutable = new ArrayList<>(scores);
        mutable.remove(Collections.min(mutable));
        int sum = 0;
        for (int roll : mutable) {
            sum += roll;
        }
        return sum;
    }

    List<Integer> rollDice() {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            result.add(rand.nextInt(6) + 1);
        }
        return result;
    }

    int modifier(int input) {
        double temp = (input - 10) / 2.0;
        return (int) Math.floor(temp);
    }

    int getStrength() {
        return this.strength;
    }

    int getDexterity() {
        return this.dexterity;
    }

    int getConstitution() {
        return this.constitution;
    }

    int getIntelligence() {
        return this.intelligence;
    }

    int getWisdom() {
        return this.wisdom;
    }

    int getCharisma() {
        return this.charisma;
    }

    int getHitpoints() {
        return 10 + modifier(this.constitution);
    }
}
