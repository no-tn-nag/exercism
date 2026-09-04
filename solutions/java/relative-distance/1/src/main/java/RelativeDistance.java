import java.util.*;

class RelativeDistance {
    private final Map<String, Set<String>> graph = new HashMap<>();

    RelativeDistance(Map<String, List<String>> familyTree) {
        buildGraph(familyTree);
    }

    private void buildGraph(Map<String, List<String>> familyTree) {
        for (String parent : familyTree.keySet()) {
            List<String> children = familyTree.get(parent);

            // parent <-> child edges
            for (String child : children) {
                graph.computeIfAbsent(parent, k -> new HashSet<>()).add(child);
                graph.computeIfAbsent(child, k -> new HashSet<>()).add(parent);
            }

            // sibling <-> sibling edges (direct connection, degree 1)
            for (int i = 0; i < children.size(); i++) {
                for (int j = i + 1; j < children.size(); j++) {
                    String siblingA = children.get(i);
                    String siblingB = children.get(j);
                    graph.computeIfAbsent(siblingA, k -> new HashSet<>()).add(siblingB);
                    graph.computeIfAbsent(siblingB, k -> new HashSet<>()).add(siblingA);
                }
            }
        }
    }

    int degreeOfSeparation(String personA, String personB) {
        if (personA.equals(personB)) return 0;
        if (!graph.containsKey(personA) || !graph.containsKey(personB)) return -1;

        Queue<String> queue = new LinkedList<>();
        Map<String, Integer> distance = new HashMap<>();
        queue.add(personA);
        distance.put(personA, 0);

        while (!queue.isEmpty()) {
            String current = queue.poll();
            int currentDist = distance.get(current);
            for (String neighbor : graph.get(current)) {
                if (!distance.containsKey(neighbor)) {
                    distance.put(neighbor, currentDist + 1);
                    if (neighbor.equals(personB)) {
                        return currentDist + 1;
                    }
                    queue.add(neighbor);
                }
            }
        }
        return -1;
    }
}