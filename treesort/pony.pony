use "collections"

class Node
    var val: I64
    var left: (Node | None)
    var right: (Node | None)

    new create(v: I64) =>
        val = v
        left = None
        right = None

primitive Insert
    fun apply(node: (Node | None), val: I64): Node =>
        match node
        | None => Node(val)
        | let n: Node =>
            if val < n.val then
                n.left = apply(n.left, val)
            else
                n.right = apply(n.right, val)
            end
            n
        end

primitive Inorder
    fun apply(node: (Node | None), result: Array[I64]) =>
        match node
        | None => None
        | let n: Node =>
            apply(n.left, result)
            result.push(n.val)
            apply(n.right, result)
        end

actor Main
    new create(env: Env) =>
        let arr: Array[I64] = [5; 3; 7; 1; 4; 6; 8]
        var root: (Node | None) = None
        for v in arr.values() do
            root = Insert(root, v)
        end
        let result: Array[I64] = Array[I64]
        Inorder(root, result)
        for v in result.values() do
            env.out.write(v.string() + " ")
        end
        env.out.print("")
