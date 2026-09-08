public class GameMaster {

    public String describe(Character character) {
        return "You're a level " + character.getLevel() + " " +
            character.getCharacterClass() + " with " + character.getHitPoints() + " hit points.";
    }

    public String describe(Destination destination) {
        return "You've arrived at " + destination.getName() + ", which has " + destination.getInhabitants() + " inhabitants.";
    }

    public String describe(TravelMethod travelmethod) {
        if (travelmethod == TravelMethod.WALKING) {
            return "You're traveling to your destination by walking.";
        }
        return "You're traveling to your destination on horseback.";
    }

    public String describe(Character character, Destination destination, TravelMethod travelmethod) {
        return describe(character) + " " + describe(travelmethod) + " " + describe(destination);
        
    }

    public String describe(Character character, Destination destination) {
        return describe(character) + " " + describe(TravelMethod.WALKING) + " " + describe(destination); 
    }
}
