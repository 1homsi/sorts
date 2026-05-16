class Node {
    Int val
    Node? left := null
    Node? right := null
    new make(Int v) { val = v }
}

class TreeSort {
    static Node insert(Node? node, Int val) {
        if (node == null) return Node(val)
        if (val < node.val) node.left = insert(node.left, val)
        else node.right = insert(node.right, val)
        return node
    }

    static Void inorder(Node? node, Int[] result) {
        if (node == null) return
        inorder(node.left, result)
        result.add(node.val)
        inorder(node.right, result)
    }

    static Int[] treesort(Int[] arr) {
        Node? root := null
        arr.each |v| { root = insert(root, v) }
        result := Int[,]
        inorder(root, result)
        return result
    }

    static Void main() {
        echo(treesort([5, 3, 7, 1, 4, 6, 8]))
    }
}
