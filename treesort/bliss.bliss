function treesort(arr) {
    if (arr.length === 0) return [];
    let root = {val: arr[0], left: null, right: null};
    for (let i = 1; i < arr.length; i++)
        insert(root, arr[i]);
    let result = [];
    inorder(root, result);
    return result;
}

function insert(node, val) {
    if (val < node.val) {
        if (node.left === null)
            node.left = {val, left: null, right: null};
        else
            insert(node.left, val);
    } else {
        if (node.right === null)
            node.right = {val, left: null, right: null};
        else
            insert(node.right, val);
    }
}

function inorder(node, result) {
    if (node === null) return;
    inorder(node.left, result);
    result.push(node.val);
    inorder(node.right, result);
}
