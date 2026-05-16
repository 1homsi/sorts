insert(empty, Val, node(Val, empty, empty)).
insert(node(V, L, R), Val, node(V, NL, R)) :- Val < V, !, insert(L, Val, NL).
insert(node(V, L, R), Val, node(V, L, NR)) :- insert(R, Val, NR).

inorder(empty, []).
inorder(node(V, L, R), Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, empty, Arr, Root),
  inorder(Root, Sorted).

:- tree_sort([5, 2, 8, 1, 9, 3], X), write(X), nl, halt.
