class RnaTranscription {

    String transcribe(String dnaStrand) {
        if (dnaStrand == "") {
            return "";
        }
        StringBuilder builder = new StringBuilder("");
        for (int i = 0; i < dnaStrand.length(); i++) {
            switch (dnaStrand.substring(i, i + 1)) {
                case "G":
                    builder.append("C");
                    break;
                case "C":
                    builder.append("G");
                    break;
                case "T":
                    builder.append("A");
                    break;
                case "A":
                    builder.append("U");
                    break;
                default:
                    return "not a valid nuc!";
            }
        }
        return builder.toString();
    }

}
