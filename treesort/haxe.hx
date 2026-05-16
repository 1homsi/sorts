class Node {
    public var val:Int;
    public var left:Node;
    public var right:Node;
    public function new(v:Int) { val = v; left = null; right = null; }
}

class TreeSort {
    static function insert(node:Node, val:Int):Node {
        if (node == null) return new Node(val);
        if (val < node.val) node.left = insert(node.left, val);
        else node.right = insert(node.right, val);
        return node;
    }

    static function inorder(node:Node, result:Array<Int>):Void {
        if (node == null) return;
        inorder(node.left, result);
        result.push(node.val);
        inorder(node.right, result);
    }

    static function treesort(arr:Array<Int>):Array<Int> {
        var root:Node = null;
        for (v in arr) root = insert(root, v);
        var result:Array<Int> = [];
        inorder(root, result);
        return result;
    }

    static function main() {
        trace(treesort([5, 3, 7, 1, 4, 6, 8]));
    }
}
