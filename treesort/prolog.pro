insert(nil, V, node(V, nil, nil)).
insert(node(X, L, R), V, node(X, NL, R)) :- V < X, !, insert(L, V, NL).
insert(node(X, L, R), V, node(X, L, NR)) :- insert(R, V, NR).

inorder(nil, []).
inorder(node(V, L, R), Result) :-
    inorder(L, Left),
    inorder(R, Right),
    append(Left, [V|Right], Result).

treesort([], nil).
treesort([H|T], Tree) :-
    treesort(T, SubTree),
    insert(SubTree, H, Tree).

main :-
    treesort([5, 3, 7, 1, 4, 6, 8], Tree),
    inorder(Tree, Sorted),
    write(Sorted), nl.

:- initialization(main, main).
