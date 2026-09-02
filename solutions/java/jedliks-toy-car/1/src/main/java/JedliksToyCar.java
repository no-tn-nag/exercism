public class JedliksToyCar {

    private int batteryPercentage = 100;
    private int distanceDriven = 0;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return "Driven " + this.distanceDriven + " meters";
    }

    public String batteryDisplay() {
        if (this.batteryPercentage == 0) {
            return "Battery empty";
        } else {
            return "Battery at " + this.batteryPercentage + "%";
        }
    }

    public void drive() {
        if (this.batteryPercentage > 0) {
            this.distanceDriven += 20;
            this.batteryPercentage -= 1;
        }
    }
}
