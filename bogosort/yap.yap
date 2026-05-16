bogosort(List, Sorted) :-
  (issorted(List) ->
    Sorted = List
  ;
    shuffle(List, Shuffled),
    bogosort(Shuffled, Sorted)
  ).

issorted([]).
issorted([_]).
issorted([X, Y|Rest]) :-
  X =< Y,
  issorted([Y|Rest]).

shuffle(List, List).

:- initialization(
  bogosort([3, 1, 2], X),
  write(X),
  nl,
  halt
).
