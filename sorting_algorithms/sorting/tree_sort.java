package sorting;

class SortingGraph {
    class Node {
        int v;
        Node l, r;
        public Node(int v) {
            this.v = v;
            l = r = null;
        }
    };
    Node root;
    int[] arr;
    public SortingGraph(int[] arr) {
        this.arr = arr;
        root = null;
        for (int i = 0; i < arr.length; i++) {
            insert(arr[i]);
        }
    }
    int iterIdx = 0;
    void inorderRec(Node root) { 
        if (root != null) {
            inorderRec(root.l);
            arr[iterIdx++] = root.v;
            inorderRec(root.r);
        }
    }
    public int[] get_sorted() {
        iterIdx = 0;
        inorderRec(root);
        return arr;
    }
    // insert
    public void insert(int val) {
        root = insert_rec(root, val);
    }
    Node insert_rec(Node root, int v) {
        if (root == null) {
            root = new Node(v);
            return root;
        }
        if (v < root.v) {
            root.l = insert_rec(root.l, v);
        } else {
            root.r = insert_rec(root.r, v);
        }
        return root;
    }
}

public final class tree_sort {
    public static int[] sort(int[] arr) {
        shuffle.array(arr);
        SortingGraph g = new SortingGraph(arr);
        return g.get_sorted();
    }
}
