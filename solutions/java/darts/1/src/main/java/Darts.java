import java.lang.Math;

class Darts {
    int score(double xOfDart, double yOfDart) {
        if (radius(xOfDart, yOfDart) <= 1.0) {
            return 10;
        } else if (radius(xOfDart, yOfDart) <= 5.0 && radius(xOfDart, yOfDart) > 1.0) {
            return 5;
        } else if (radius(xOfDart, yOfDart) <= 10.0 && radius(xOfDart, yOfDart) > 5.0) {
            return 1;
        } else {
            return 0;
        }
    }

    double radius(double x, double y) {
        return Math.sqrt(Math.pow(x, 2) + Math.pow(y, 2));
    }
}
