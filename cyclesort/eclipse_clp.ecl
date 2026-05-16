cyclesort(Arr, Sorted) :-
  length(Arr, N),
  cyclesort_loop(Arr, 0, N, Sorted).

cyclesort_loop(Arr, Pos, N, Arr) :- Pos >= N, !.
cyclesort_loop(Arr, Pos, N, Result) :-
  Pos < N,
  arg(Pos, Arr, Item),
  count_less(Arr, Pos, Item, Cycles),
  (Cycles = 0 ->
    Pos1 is Pos + 1,
    cyclesort_loop(Arr, Pos1, N, Result)
  ;
    process_cycle(Arr, Pos, Item, Cycles, Arr1),
    Pos1 is Pos + 1,
    cyclesort_loop(Arr1, Pos1, N, Result)
  ).

count_less(Arr, Pos, Item, Count) :-
  length(Arr, N),
  findall(1, (between(0, N, I), I \= Pos, arg(I, Arr, Val), Val < Item), L),
  length(L, Count).

process_cycle(Arr, Pos, Item, Cycles, Result) :-
  skip_duplicates(Arr, Pos, Item, Pos1),
  arg(Pos1, Arr, Temp),
  setarg(Pos1, Arr, Item),
  process_cycle_loop(Arr, Pos1, Temp, Cycles, Result).

process_cycle_loop(Arr, _Pos, _Item, 0, Arr) :- !.
process_cycle_loop(Arr, Pos, Item, Cycles, Result) :-
  Cycles > 0,
  count_less(Arr, Pos, Item, NewCycles),
  skip_duplicates(Arr, Pos, Item, Pos1),
  arg(Pos1, Arr, Temp),
  setarg(Pos1, Arr, Item),
  Cycles1 is Cycles - 1,
  process_cycle_loop(Arr, Pos1, Temp, Cycles1, Result).

skip_duplicates(Arr, Pos, Item, Pos) :-
  arg(Pos, Arr, Val),
  Val \= Item, !.
skip_duplicates(Arr, Pos, Item, Result) :-
  Pos1 is Pos + 1,
  skip_duplicates(Arr, Pos1, Item, Result).
