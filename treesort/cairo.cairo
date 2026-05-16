use array::ArrayTrait;

#[derive(Drop)]
enum Tree {
    Leaf: (),
    Node: (Box<Tree>, felt252, Box<Tree>),
}

fn insert(tree: Tree, v: felt252) -> Tree {
    match tree {
        Tree::Leaf(()) => Tree::Node((BoxTrait::new(Tree::Leaf(())), v, BoxTrait::new(Tree::Leaf(())))),
        Tree::Node((l, x, r)) => {
            if v < x {
                Tree::Node((BoxTrait::new(insert(*l, v)), x, r))
            } else {
                Tree::Node((l, x, BoxTrait::new(insert(*r, v))))
            }
        },
    }
}

fn inorder(tree: @Tree, ref result: Array<felt252>) {
    match tree {
        Tree::Leaf(()) => {},
        Tree::Node((l, v, r)) => {
            inorder(l.unbox(), ref result);
            result.append(*v);
            inorder(r.unbox(), ref result);
        },
    }
}

fn treesort(arr: Array<felt252>) -> Array<felt252> {
    let mut tree = Tree::Leaf(());
    let mut i = 0;
    loop {
        if i >= arr.len() { break; }
        tree = insert(tree, *arr.at(i));
        i += 1;
    };
    let mut result = ArrayTrait::new();
    inorder(@tree, ref result);
    result
}
