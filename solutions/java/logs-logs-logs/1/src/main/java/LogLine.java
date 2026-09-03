public class LogLine {

    private final String logLine;

    public LogLine(String logLine) {
        this.logLine = logLine;
    }

    public LogLevel getLogLevel() {
        String code = logLine.substring(1, logLine.indexOf(']'));
        switch (code) {
            case "TRC": return LogLevel.TRACE;
            case "DBG": return LogLevel.DEBUG;
            case "INF": return LogLevel.INFO;
            case "WRN": return LogLevel.WARNING;
            case "ERR": return LogLevel.ERROR;
            case "FTL": return LogLevel.FATAL;
            default:    return LogLevel.UNKNOWN;
        }
    }

    private String getMessage() {
        int colonIndex = logLine.indexOf(':');
        return logLine.substring(colonIndex + 2); // ": " überspringen
    }

    public String getOutputForShortLog() {
        return getLogLevel().getCode() + ":" + getMessage();
    }
}