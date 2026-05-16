:- module mercury.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.
:- implementation.
:- import_module list, int.

:- type tree ---> leaf ; node(tree, int, tree).

:- func insert(tree, int) = tree.
insert(leaf, V) = node(leaf, V, leaf).
insert(node(L, X, R), V) = Result :-
    ( V < X -> Result = node(insert(L, V), X, R)
    ; Result = node(L, X, insert(R, V)) ).

:- func inorder(tree) = list(int).
inorder(leaf) = [].
inorder(node(L, V, R)) = inorder(L) ++ [V] ++ inorder(R).

:- func treesort(list(int)) = list(int).
treesort(Arr) = inorder(list.foldl(insert, Arr, leaf)).

main(!IO) :-
    Sorted = treesort([5, 3, 7, 1, 4, 6, 8]),
    io.write(Sorted, !IO),
    io.nl(!IO).
