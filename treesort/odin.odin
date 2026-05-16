package main

import "core:fmt"

Node :: struct {
    val:   int,
    left:  ^Node,
    right: ^Node,
}

insert :: proc(node: ^Node, val: int) -> ^Node {
    if node == nil {
        n := new(Node)
        n.val = val
        return n
    }
    if val < node.val do node.left = insert(node.left, val)
    else do node.right = insert(node.right, val)
    return node
}

inorder :: proc(node: ^Node, result: ^[dynamic]int) {
    if node == nil do return
    inorder(node.left, result)
    append(result, node.val)
    inorder(node.right, result)
}

treesort :: proc(arr: []int) -> [dynamic]int {
    root: ^Node = nil
    for v in arr do root = insert(root, v)
    result: [dynamic]int
    inorder(root, &result)
    return result
}

main :: proc() {
    arr := []int{5, 3, 7, 1, 4, 6, 8}
    sorted := treesort(arr)
    fmt.println(sorted)
}
