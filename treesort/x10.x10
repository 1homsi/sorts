import x10.util.ArrayList;

public class TreeSort {
    static class Node {
        var val: Long;
        var left: Node;
        var right: Node;
        def this(v: Long) { val = v; left = null; right = null; }
    }

    static def insert(node: Node, val: Long): Node {
        if (node == null) return new Node(val);
        if (val < node.val) node.left = insert(node.left, val);
        else node.right = insert(node.right, val);
        return node;
    }

    static def inorder(node: Node, result: ArrayList[Long]): void {
        if (node == null) return;
        inorder(node.left, result);
        result.add(node.val);
        inorder(node.right, result);
    }

    static def treesort(arr: Rail[Long]): ArrayList[Long] {
        var root: Node = null;
        for (v in arr) root = insert(root, v);
        val result = new ArrayList[Long]();
        inorder(root, result);
        return result;
    }

    public static def main(Rail[String]) {
        val arr = [5L, 3L, 7L, 1L, 4L, 6L, 8L] as Rail[Long];
        val sorted = treesort(arr);
        Console.OUT.println(sorted);
    }
}
