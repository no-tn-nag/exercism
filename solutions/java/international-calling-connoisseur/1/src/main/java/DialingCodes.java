import java.util.Map;
import java.util.HashMap;


public class DialingCodes {

    Map<Integer, String> dictionary = new HashMap<>();

    public Map<Integer, String> getCodes() {
        return this.dictionary;
    }

    public void setDialingCode(Integer code, String country) {
        this.dictionary.put(code, country);
    }

    public String getCountry(Integer code) {
        return this.dictionary.get(code);
    }

    public void addNewDialingCode(Integer code, String country) {
        if (!this.dictionary.containsKey(code) && !this.dictionary.containsValue(country)) {
            setDialingCode(code, country);
        }
    }

    public Integer findDialingCode(String country) {
        for (int i : this.dictionary.keySet()) {
            if (this.dictionary.get(i) == country) {
                return i;
            }
        }
        return null;
    }

    public void updateCountryDialingCode(Integer code, String country) {
        if (findDialingCode(country) != null) {
            int a = findDialingCode(country);
            this.dictionary.remove(a);
            addNewDialingCode(code, country);
        }
    }
}








