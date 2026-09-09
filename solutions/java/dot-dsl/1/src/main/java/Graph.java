import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class Graph {

    private final Map<String, String> attributes;
    private final List<Node> nodes = new ArrayList<>();
    private final List<Edge> edges = new ArrayList<>();

    public Graph() {
        this.attributes = new LinkedHashMap<>();
    }

    public Graph(Map<String, String> attributes) {
        this.attributes = new LinkedHashMap<>(attributes);
    }

    public Collection<Node> getNodes() {
        return List.copyOf(nodes);
    }

    public Collection<Edge> getEdges() {
        return List.copyOf(edges);
    }

    public Graph node(String name) {
        nodes.add(new Node(name));
        return this;
    }

    public Graph node(String name, Map<String, String> attributes) {
        nodes.add(new Node(name, attributes));
        return this;
    }

    public Graph edge(String start, String end) {
        edges.add(new Edge(start, end));
        return this;
    }

    public Graph edge(String start, String end, Map<String, String> attributes) {
        edges.add(new Edge(start, end, attributes));
        return this;
    }

    public Map<String, String> getAttributes() {
        return Map.copyOf(attributes);
    }
}