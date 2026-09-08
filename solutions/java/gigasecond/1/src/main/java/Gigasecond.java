import java.time.LocalDate;
import java.time.LocalDateTime;

public class Gigasecond {

    LocalDateTime moment;
    
    public Gigasecond(LocalDate moment) {
        this.moment = moment.atStartOfDay();
    }

    public Gigasecond(LocalDateTime moment) {
        this.moment = moment;
    }

    public LocalDateTime getDateTime() {
        return this.moment.plusDays(11574).plusHours(1).plusMinutes(46).plusSeconds(40);
    }
}
