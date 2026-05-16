import java.util.ArrayList
import java.util.List

class Node {
    public int val
    public Node left
    public Node right
    new(int v) { val = v }
}

class TreeSort {
    def static Node insert(Node node, int val) {
        if (node === null) return new Node(val)
        if (val < node.val) node.left = insert(node.left, val)
        else node.right = insert(node.right, val)
        node
    }

    def static void inorder(Node node, List<Integer> result) {
        if (node === null) return
        inorder(node.left, result)
        result.add(node.val)
        inorder(node.right, result)
    }

    def static List<Integer> treesort(int[] arr) {
        var Node root = null
        for (v : arr) root = insert(root, v)
        val result = new ArrayList<Integer>
        inorder(root, result)
        result
    }

    def static void main(String[] args) {
        println(treesort(#[5, 3, 7, 1, 4, 6, 8]))
    }
}
