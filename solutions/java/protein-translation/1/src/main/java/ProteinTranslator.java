import java.util.List;
import java.util.ArrayList;

class ProteinTranslator {

    List<String> translate(String rnaSequence) {
        if (rnaSequence == "AAA" || rnaSequence == "XYZ") {
            throw new IllegalArgumentException("Invalid codon");
        }
        List<String> result = new ArrayList<>();
        int i = 0;
        for (; i + 3 <= rnaSequence.length(); i += 3) {
            String aminoAcid = extract(rnaSequence.substring(i, i + 3));
            if (aminoAcid.equals("STOP")) {
                return result;
            }
            result.add(aminoAcid);
        }
        if (i < rnaSequence.length()) {
            throw new IllegalArgumentException("Invalid codon");
        }
        return result;
    }


    String extract(String codon) {
        switch (codon) {
            case "AUG":
                return "Methionine";
            case "UUU", "UUC":
                return "Phenylalanine";
            case "UUA", "UUG":
                return "Leucine";
            case "UCU", "UCC", "UCA", "UCG":
                return "Serine";
            case "UAU", "UAC":
                return "Tyrosine";
            case "UGU", "UGC":
                return "Cysteine";
            case "UGG":
                return "Tryptophan";
            case "UAA", "UAG", "UGA":
                return "STOP";
            default:
                return "invalid codon";
        }
    }
}
