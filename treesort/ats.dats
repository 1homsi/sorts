datatype tree =
    | Leaf
    | Node of (tree, int, tree)

fun insert (t: tree, v: int): tree =
    case t of
    | Leaf () => Node(Leaf, v, Leaf)
    | Node(l, x, r) =>
        if v < x then Node(insert(l, v), x, r)
        else Node(l, x, insert(r, v))

fun inorder (t: tree): List0(int) =
    case t of
    | Leaf () => list_nil()
    | Node(l, v, r) =>
        list_append(inorder(l), list_cons(v, inorder(r)))

fun treesort (arr: List0(int)): List0(int) =
    let
        fun foldl {a:type}{b:type} (f: (b, a) -> b, z: b, xs: List0(a)): b =
            case xs of
            | list_nil() => z
            | list_cons(x, rest) => foldl(f, f(z, x), rest)
        val tree = foldl(lam (t, v) => insert(t, v), Leaf, arr)
    in
        inorder(tree)
    end

implement main0() =
    let
        val arr = list_cons(5, list_cons(3, list_cons(7, list_cons(1,
                  list_cons(4, list_cons(6, list_cons(7, list_nil())))))))
        val sorted = treesort(arr)
    in
        print_list_int(sorted); print_newline()
    end
