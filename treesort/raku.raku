class Node {
    has Int $.val;
    has Node $.left is rw;
    has Node $.right is rw;
}

sub insert(Node $node is copy, Int $val --> Node) {
    unless $node.defined {
        return Node.new(val => $val);
    }
    if $val < $node.val {
        $node.left = insert($node.left, $val);
    } else {
        $node.right = insert($node.right, $val);
    }
    $node;
}

sub inorder(Node $node, @result) {
    return unless $node.defined;
    inorder($node.left, @result);
    push @result, $node.val;
    inorder($node.right, @result);
}

sub treesort(@arr) {
    my Node $root;
    for @arr -> $v { $root = insert($root, $v); }
    my @result;
    inorder($root, @result);
    @result;
}

say treesort([5, 3, 7, 1, 4, 6, 8]);
