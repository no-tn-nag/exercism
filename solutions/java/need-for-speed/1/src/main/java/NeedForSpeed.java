class NeedForSpeed {

    public int speed;
    public int batteryDrain;
    public int batteryPercentage = 100;
    public int distance = 0;
    
    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
    }

    public boolean batteryDrained() {
        return this.batteryDrain > this.batteryPercentage;
    }

    public int distanceDriven() {
        return this.distance;
    }

    public void drive() {
        if (this.batteryPercentage >= this.batteryDrain) {
            this.distance += this.speed;
            this.batteryPercentage -= this.batteryDrain;
        }
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {

    private int distance;
    
    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean canFinishRace(NeedForSpeed car) {
        double mult = (double) this.distance / (double) car.speed;
        if (car.batteryPercentage >= (mult * (double) car.batteryDrain)) {
            return true;
        } else {
            return false;
        }
    }
}
