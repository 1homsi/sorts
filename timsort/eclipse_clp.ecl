:- module(timsort).

:- export timsort/3.

timsort(Arr, MinSize, Result) :-
  mergesort(Arr, MinSize, Result).

mergesort([], _, []) :- !.
mergesort([X], _, [X]) :- !.
mergesort(Arr, MinSize, Result) :-
  length(Arr, Len),
  Len =< MinSize,
  !,
  insertionsort(Arr, Result).
mergesort(Arr, MinSize, Result) :-
  length(Arr, Len),
  Mid is Len // 2,
  split_at(Arr, Mid, Left, Right),
  mergesort(Left, MinSize, SortedLeft),
  mergesort(Right, MinSize, SortedRight),
  merge(SortedLeft, SortedRight, Result).

insertionsort([], []) :- !.
insertionsort([H|T], Result) :-
  insertionsort(T, SortedT),
  insert_elem(H, SortedT, Result).

insert_elem(X, [], [X]) :- !.
insert_elem(X, [H|T], [X, H|T]) :-
  X =< H,
  !.
insert_elem(X, [H|T], [H|R]) :-
  insert_elem(X, T, R).

merge([], R, R) :- !.
merge(L, [], L) :- !.
merge([H1|T1], [H2|T2], [H1|R]) :-
  H1 =< H2,
  !,
  merge(T1, [H2|T2], R).
merge(L, [H|T], [H|R]) :-
  merge(L, T, R).

split_at([], _, [], []) :- !.
split_at(List, 0, [], List) :- !.
split_at([H|T], N, [H|L], R) :-
  N > 0,
  N1 is N - 1,
  split_at(T, N1, L, R).
