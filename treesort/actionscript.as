package {
    public class Node {
        public var val:int;
        public var left:Node;
        public var right:Node;
        public function Node(v:int) { val = v; left = null; right = null; }
    }

    public class TreeSort {
        private static function insert(node:Node, val:int):Node {
            if (node == null) return new Node(val);
            if (val < node.val) node.left = insert(node.left, val);
            else node.right = insert(node.right, val);
            return node;
        }

        private static function inorder(node:Node, result:Array):void {
            if (node == null) return;
            inorder(node.left, result);
            result.push(node.val);
            inorder(node.right, result);
        }

        public static function treesort(arr:Array):Array {
            var root:Node = null;
            for each (var v:int in arr) root = insert(root, v);
            var result:Array = [];
            inorder(root, result);
            return result;
        }

        public static function main():void {
            trace(treesort([5, 3, 7, 1, 4, 6, 8]));
        }
    }
}
