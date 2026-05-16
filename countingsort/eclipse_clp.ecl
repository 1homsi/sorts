:- module(countingsort).

countingsort([], []).
countingsort(Arr, Output) :-
  findall(Max, (member(X, Arr), X > 0, Max = X), MaxList),
  (MaxList = [] -> M = 0; max_member(M, Arr)),
  length(Arr, Len),
  create_count(M, CountTemplate),
  fill_count(Arr, CountTemplate, Count),
  rebuild_output(0, M, Count, Output).

create_count(N, List) :-
  length(List, N1),
  N1 is N + 1,
  maplist(=(0), List).

fill_count([], Count, Count).
fill_count([H|T], Count, Count1) :-
  nth0(H, Count, V),
  V1 is V + 1,
  nb_setarg(H, Count, V1),
  fill_count(T, Count, Count1).

rebuild_output(I, Max, _, []) :- I > Max.
rebuild_output(I, Max, Count, Output) :-
  I =< Max,
  nth0(I, Count, V),
  I1 is I + 1,
  findall(I, between(1, V, _), Reps),
  rebuild_output(I1, Max, Count, Rest),
  append(Reps, Rest, Output).

:- initialization(main).
main :- countingsort([5, 2, 8, 1, 9, 3], R), write(R), nl, halt.
