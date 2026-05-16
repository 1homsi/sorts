:- module(gnomesort, [gnomesort/2]).

gnomesort(List, Sorted) :-
  append(Left, [X, Y | Right], List),
  X > Y,
  !,
  gnomesort([X | Left] ++ [Y] ++ Right, Sorted).
gnomesort(Sorted, Sorted).

:- initialization(main).

main :-
  gnomesort([5, 2, 8, 1, 9, 3], Result),
  write(Result), nl,
  halt.
