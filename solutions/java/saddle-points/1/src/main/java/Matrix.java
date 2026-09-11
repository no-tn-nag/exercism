import java.util.List;
import java.util.Set;
import java.util.HashSet;



class Matrix {

    List<List<Integer>> values;

    Matrix(List<List<Integer>> values) {
        this.values = values;
    }

    Set<MatrixCoordinate> getSaddlePoints() {
        Set<MatrixCoordinate> candidates = new HashSet<>();
        if (values.isEmpty()) {
            return candidates;
        }
        int[] maxRows = new int[values.size()];
        for (int i = 0; i < values.size(); i++) {
            int max = 0;
            for (int j = 0; j < values.get(i).size(); j++) {
                if (values.get(i).get(j) > max) max = values.get(i).get(j);
            }
            maxRows[i] = max;
        }

        int[] minCol = new int[values.get(0).size()];
        for (int i = 0; i < values.get(0).size(); i++) {
            int min = Integer.MAX_VALUE;
            for (int j = 0; j < values.size(); j++) {
                if (values.get(j).get(i) < min) min = values.get(j).get(i);
            }
            minCol[i] = min;
        }

        for (int i = 0; i < values.size(); i++) {
            for (int j = 0; j < values.get(0).size(); j++) {
                if (values.get(i).get(j) == maxRows[i] && values.get(i).get(j) == minCol[j]) {
                    candidates.add(new MatrixCoordinate(i + 1, j + 1));
                }
            }
        }
        return candidates;
        
    }
}
