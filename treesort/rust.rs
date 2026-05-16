enum Tree {
    Leaf,
    Node(Box<Tree>, i64, Box<Tree>),
}

fn insert(tree: Tree, val: i64) -> Tree {
    match tree {
        Tree::Leaf => Tree::Node(Box::new(Tree::Leaf), val, Box::new(Tree::Leaf)),
        Tree::Node(left, v, right) => {
            if val < v {
                Tree::Node(Box::new(insert(*left, val)), v, right)
            } else {
                Tree::Node(left, v, Box::new(insert(*right, val)))
            }
        }
    }
}

fn inorder(tree: &Tree, result: &mut Vec<i64>) {
    match tree {
        Tree::Leaf => {}
        Tree::Node(left, v, right) => {
            inorder(left, result);
            result.push(*v);
            inorder(right, result);
        }
    }
}

fn treesort(arr: &[i64]) -> Vec<i64> {
    let mut root = Tree::Leaf;
    for &val in arr {
        root = insert(root, val);
    }
    let mut result = Vec::new();
    inorder(&root, &mut result);
    result
}

fn main() {
    println!("{:?}", treesort(&[5, 3, 7, 1, 4, 6, 8]));
}
