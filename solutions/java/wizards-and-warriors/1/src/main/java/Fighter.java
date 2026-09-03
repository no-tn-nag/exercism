class Fighter {

    boolean isVulnerable() {
        return true;
    }

    int getDamagePoints(Fighter fighter) {
        return 1;
    }
}

class Warrior extends Fighter {

    @Override
    boolean isVulnerable() {
        return false;
    }

    @Override
    int getDamagePoints(Fighter fighter) {
        if (fighter.isVulnerable()) {
            return 10;
        } else {
            return 6;
        }
    }

    public String toString() {
        return "Fighter is a Warrior";
    }
}

class Wizard extends Fighter {

    public boolean hasPreparedSpell;

    @Override
    boolean isVulnerable() {
        if (hasPreparedSpell) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    int getDamagePoints(Fighter fighter) {
        if (hasPreparedSpell) {
            return 12;
        } else {
            return 3;
        }
    }

    void prepareSpell() {
        hasPreparedSpell = true;
    }

    public String toString() {
        return "Fighter is a Wizard";
    }
    
}
