data class Node(val v: Int, var left: Node? = null, var right: Node? = null)

fun insert(node: Node?, v: Int): Node {
    if (node == null) return Node(v)
    if (v < node.v) node.left = insert(node.left, v)
    else node.right = insert(node.right, v)
    return node
}

fun inorder(node: Node?, result: MutableList<Int>) {
    node ?: return
    inorder(node.left, result)
    result.add(node.v)
    inorder(node.right, result)
}

fun treesort(arr: List<Int>): List<Int> {
    var root: Node? = null
    arr.forEach { root = insert(root, it) }
    val result = mutableListOf<Int>()
    inorder(root, result)
    return result
}

fun main() = println(treesort(listOf(5, 3, 7, 1, 4, 6, 8)))
