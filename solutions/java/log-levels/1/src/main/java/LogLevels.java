public class LogLevels {
    
    public static String message(String logLine) {
        String[] arr = logLine.split(" ");
        String output = "";
        for (int i = 1; i < arr.length; i++) {
            output += arr[i];
            output += " ";
        }
        return output.strip();
    }

    public static String logLevel(String logLine) {
        String[] arr = logLine.split(" ");
        String first = arr[0];
        String second = first.replaceAll("[^a-zA-Z]", "");
        second.strip();
        return second.toLowerCase();
    }

    public static String reformat(String logLine) {
        String level = logLevel(logLine);
        String mess = message(logLine);
        return mess + " (" + level + ")";
    }
}
