class SpaceAge {

    private double seconds;

    SpaceAge(double seconds) {
        this.seconds = seconds;
    }

    double getSeconds() {
        return this.seconds;
    }

    double onEarth() {
        return this.seconds / 31557600;
    }

    double onMercury() {
        double temp = this.seconds / 31557600;
        return temp / 0.2408467;
    }

    double onVenus() {
        double temp = this.seconds / 31557600;
        return temp / 0.61519726;
    }

    double onMars() {
        double temp = this.seconds / 31557600;
        return temp / 1.8808158;
    }

    double onJupiter() {
        double temp = this.seconds / 31557600;
        return temp / 11.862615;
    }

    double onSaturn() {
        double temp = this.seconds / 31557600;
        return temp / 29.447498;
    }

    double onUranus() {
        double temp = this.seconds / 31557600;
        return temp / 84.016846;
    }

    double onNeptune() {
        double temp = this.seconds / 31557600;
        return temp / 164.79132;
    }

}
