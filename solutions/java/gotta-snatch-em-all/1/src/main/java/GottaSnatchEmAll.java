import java.util.List;
import java.util.Set;
import java.util.Collections;
import java.util.HashSet;

class GottaSnatchEmAll {

    static Set<String> newCollection(List<String> cards) {
        return Set.copyOf(cards);
    }

    static boolean addCard(String card, Set<String> collection) {
        return collection.add(card);
    }

    static boolean canTrade(Set<String> myCollection, Set<String> theirCollection) {
        if (myCollection.isEmpty() || theirCollection.isEmpty()) {
            return false;
        } else {
            boolean iHaveSomethingTheyDont = !theirCollection.containsAll(myCollection);
            boolean theyHaveSomethingIDont = !myCollection.containsAll(theirCollection);
            return iHaveSomethingTheyDont && theyHaveSomethingIDont;
        }
    }

    static Set<String> commonCards(List<Set<String>> collections) {
        if (collections.isEmpty()) {
        return new HashSet<>();
    }

    Set<String> common = new HashSet<>(collections.get(0));
        for (Set<String> collection : collections.subList(1, collections.size())) {
            common.retainAll(collection);
        }
        return common;
    }

    static Set<String> allCards(List<Set<String>> collections) {
        Set<String> all = new HashSet<>();
        for (Set<String> collection : collections) {
            all.addAll(collection);
        }
        return all;
    }
}
