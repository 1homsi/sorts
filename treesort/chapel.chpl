class Node {
    var val: int;
    var left: borrowed Node? = nil;
    var right: borrowed Node? = nil;
}

proc insert(node: borrowed Node?, val: int): owned Node {
    if node == nil {
        return new owned Node(val=val);
    }
    if val < node!.val {
        node!.left = insert(node!.left, val).borrow();
    } else {
        node!.right = insert(node!.right, val).borrow();
    }
    return node!;
}

proc inorder(node: borrowed Node?, ref result: list(int)) {
    if node == nil then return;
    inorder(node!.left, result);
    result.append(node!.val);
    inorder(node!.right, result);
}

proc treesort(arr: [] int): list(int) {
    var root: borrowed Node? = nil;
    for v in arr do root = insert(root, v).borrow();
    var result: list(int);
    inorder(root, result);
    return result;
}

var arr = [5, 3, 7, 1, 4, 6, 8];
writeln(treesort(arr));
