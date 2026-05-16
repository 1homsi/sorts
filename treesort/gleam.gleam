import gleam/io
import gleam/list

type Tree {
  Leaf
  Node(left: Tree, val: Int, right: Tree)
}

fn insert(tree: Tree, v: Int) -> Tree {
  case tree {
    Leaf -> Node(Leaf, v, Leaf)
    Node(l, x, r) ->
      case v < x {
        True -> Node(insert(l, v), x, r)
        False -> Node(l, x, insert(r, v))
      }
  }
}

fn inorder(tree: Tree) -> List(Int) {
  case tree {
    Leaf -> []
    Node(l, v, r) -> list.append(inorder(l), [v, ..inorder(r)])
  }
}

fn treesort(arr: List(Int)) -> List(Int) {
  let tree = list.fold(arr, Leaf, insert)
  inorder(tree)
}

pub fn main() {
  io.debug(treesort([5, 3, 7, 1, 4, 6, 8]))
}
