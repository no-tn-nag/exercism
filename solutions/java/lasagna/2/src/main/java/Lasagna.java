public class Lasagna {
    private static int EXPECTEDMINUTES = 40;
    private static int TIMEPERLAYER = 2;
    
    public int expectedMinutesInOven() {
        return EXPECTEDMINUTES;
    }

    public int remainingMinutesInOven(int actualTime) {
        return EXPECTEDMINUTES - actualTime;
    }

    public int preparationTimeInMinutes(int layers) {
        return TIMEPERLAYER * layers;
    }

    public int totalTimeInMinutes(int layers, int actualTime) {
        return preparationTimeInMinutes(layers) + actualTime;
    }
}
