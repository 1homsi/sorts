insert[Null, v_] := {v, Null, Null}
insert[{x_, l_, r_}, v_] /; v < x := {x, insert[l, v], r}
insert[{x_, l_, r_}, v_] := {x, l, insert[r, v]}

inorder[Null] := {}
inorder[{v_, l_, r_}] := Join[inorder[l], {v}, inorder[r]]

treesort[arr_] := Module[{tree = Null},
    tree = Fold[insert, Null, arr];
    inorder[tree]
]

Print[treesort[{5, 3, 7, 1, 4, 6, 8}]]
