bitonicsort([], _, _, _) :- !.
bitonicsort(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    bitonicsort(Arr, Lo, K, 1),
    Lo1 is Lo + K,
    bitonicsort(Arr, Lo1, K, 0),
    bitonicmerge(Arr, Lo, Cnt, Dir).

bitonicmerge([], _, _, _) :- !.
bitonicmerge(Arr, Lo, Cnt, Dir) :-
    Cnt > 1,
    K is Cnt // 2,
    swap_elements(Arr, Lo, K, Dir),
    bitonicmerge(Arr, Lo, K, Dir),
    Lo1 is Lo + K,
    bitonicmerge(Arr, Lo1, K, Dir).

swap_elements(_, _, _, _).

?- bitonicsort([5, 2, 8, 1, 9, 3, 7, 4], 0, 8, 1), write([5, 2, 8, 1, 9, 3, 7, 4]), nl, halt.
