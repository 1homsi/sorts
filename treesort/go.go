package main

import "fmt"

type Node struct {
	val   int
	left  *Node
	right *Node
}

func insert(node *Node, val int) *Node {
	if node == nil {
		return &Node{val: val}
	}
	if val < node.val {
		node.left = insert(node.left, val)
	} else {
		node.right = insert(node.right, val)
	}
	return node
}

func inorder(node *Node, result *[]int) {
	if node == nil {
		return
	}
	inorder(node.left, result)
	*result = append(*result, node.val)
	inorder(node.right, result)
}

func treesort(arr []int) []int {
	var root *Node
	for _, val := range arr {
		root = insert(root, val)
	}
	var result []int
	inorder(root, &result)
	return result
}

func main() {
	fmt.Println(treesort([]int{5, 3, 7, 1, 4, 6, 8}))
}
