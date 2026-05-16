namespace TreeSort {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    newtype Node = (Value: Int, Left: Node?, Right: Node?);

    function Insert(node: Node?, val: Int): Node {
        match node {
            case null => Node(val, null, null)
            case n =>
                if val < n::Value {
                    Node(n::Value, Insert(n::Left, val), n::Right)
                } else if val > n::Value {
                    Node(n::Value, n::Left, Insert(n::Right, val))
                } else {
                    n
                }
        }
    }

    function Inorder(node: Node?, result: Int[]): Int[] {
        match node {
            case null => result
            case n =>
                let left = Inorder(n::Left, result);
                let withNode = left + [n::Value];
                Inorder(n::Right, withNode)
        }
    }

    function TreeSort(arr: Int[]): Int[] {
        mutable root = null;
        for val in arr {
            set root = Insert(root, val);
        }
        Inorder(root, [])
    }
}
