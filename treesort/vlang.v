struct Node {
mut:
	val   int
	left  &Node = unsafe { nil }
	right &Node = unsafe { nil }
}

fn insert(node &Node, val int) &Node {
	if isnil(node) {
		return &Node{ val: val }
	}
	if val < node.val {
		unsafe { node.left = insert(node.left, val) }
	} else {
		unsafe { node.right = insert(node.right, val) }
	}
	return node
}

fn inorder(node &Node, mut result []int) {
	if isnil(node) { return }
	inorder(node.left, mut result)
	result << node.val
	inorder(node.right, mut result)
}

fn treesort(arr []int) []int {
	mut root := &Node(unsafe { nil })
	for v in arr {
		root = insert(root, v)
	}
	mut result := []int{}
	inorder(root, mut result)
	return result
}

fn main() {
	println(treesort([5, 3, 7, 1, 4, 6, 8]))
}
