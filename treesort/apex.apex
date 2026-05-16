public class TreeSort {
    public class Node {
        public Integer val;
        public Node left, right;
        public Node(Integer v) { val = v; }
    }

    public static Node insert(Node node, Integer val) {
        if (node == null) return new Node(val);
        if (val < node.val) node.left = insert(node.left, val);
        else node.right = insert(node.right, val);
        return node;
    }

    public static void inorder(Node node, List<Integer> result) {
        if (node == null) return;
        inorder(node.left, result);
        result.add(node.val);
        inorder(node.right, result);
    }

    public static List<Integer> treesort(List<Integer> arr) {
        Node root = null;
        for (Integer val : arr) root = insert(root, val);
        List<Integer> result = new List<Integer>();
        inorder(root, result);
        return result;
    }

    public static void main() {
        List<Integer> sorted = treesort(new List<Integer>{5, 3, 7, 1, 4, 6, 8});
        System.debug(sorted);
    }
}
