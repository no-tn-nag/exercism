import java.util.List;
import java.util.Comparator;

public class TestTrack {

    public static void race(RemoteControlCar car) {
        car.drive();
    }

    public static List<ProductionRemoteControlCar> getRankedCars(List<ProductionRemoteControlCar> cars) {
        cars.sort(Comparator.comparing(ProductionRemoteControlCar::getNumberOfVictories).reversed());
        return cars;
    }
}
