class ResistorColorTrio {
    String label(String[] colors) {
        String temp1 = colorTranslation(colors[0]) + colorTranslation(colors[1]);
        String temp2 = colorTranslation(colors[2]);
        int nrOfZeroes = Integer.parseInt(temp2);
        for (int i = 0; i < nrOfZeroes; i++) {
            temp1 += "0";
        }
        long number = Long.parseLong(temp1);
        String postFix = " ohms";
        if (number % 1000000000 == 0) {
            if (number != 0) {
                postFix = " gigaohms";
            }
            number = number / 1000000000;
        } else if (number % 1000000 == 0) {
            postFix = " megaohms";
            number = number / 1000000;
        } else if (number % 1000 == 0) {
            postFix = " kiloohms";
            number = number / 1000;
        }
        return number + postFix;
    }


    String colorTranslation(String color) {
        switch (color) {
            case "black":
                return "0";
            case "brown":
                return "1";
            case "red":
                return "2";
            case "orange":
                return "3";
            case "yellow":
                return "4";
            case "green":
                return "5";
            case "blue":
                return "6";
            case "violet":
                return "7";
            case "grey":
                return "8";
            case "white":
                return "9";
            default:
                return "not a valid color!";
        }
    }
}
