import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;


class AppointmentScheduler {
    public LocalDateTime schedule(String appointmentDateDescription) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d/yyyy H:mm:ss");
        return LocalDateTime.parse(appointmentDateDescription, formatter);
    }

    public boolean hasPassed(LocalDateTime appointmentDate) {
        return appointmentDate.isBefore(LocalDateTime.now());
    }

    public boolean isAfternoonAppointment(LocalDateTime appointmentDate) {
        LocalDateTime six = LocalDateTime.of(appointmentDate.getYear(), appointmentDate.getMonth(), 
                                             appointmentDate.getDayOfMonth(), 18, 0, 0);
        LocalDateTime twelve = LocalDateTime.of(appointmentDate.getYear(), appointmentDate.getMonth(), 
                                             appointmentDate.getDayOfMonth(), 12, 0, 0);
        return appointmentDate.isBefore(six) && (appointmentDate.isAfter(twelve) || appointmentDate.isEqual(twelve));
    }

    public String getDescription(LocalDateTime appointmentDate) {
        DateTimeFormatter hourForm = DateTimeFormatter.ofPattern("h:mm a");
        DateTimeFormatter monthForm = DateTimeFormatter.ofPattern("MMMM");
        String formattedHour = appointmentDate.format(hourForm);
        String formattedMonth = appointmentDate.format(monthForm);
        return "You have an appointment on "+ appointmentDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH) + ", " +
            formattedMonth + " " + appointmentDate.getDayOfMonth() + ", " + appointmentDate.getYear() + ", at " + formattedHour + ".";
    }

    public LocalDate getAnniversaryDate() {
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        return LocalDate.of(year, 9, 15);
    }
}
