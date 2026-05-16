:- module(heapsort, [heapsort/1]).

heapsort(Arr) :-
    length(Arr, N),
    I is N // 2 - 1,
    heapify(Arr, I, N, H1),
    sort_down(H1, N, 1, Result),
    write(Result), nl.

heapify(Arr, I, N, Arr) :- I < 0, !.
heapify(Arr, I, N, Result) :-
    I >= 0,
    siftdown(Arr, I, N, H1),
    I1 is I - 1,
    heapify(H1, I1, N, Result).

sort_down(Arr, N, I, Arr) :- I >= N, !.
sort_down(Arr, N, I, Result) :-
    I < N,
    swap(Arr, 0, I, H1),
    N1 is N - 1,
    siftdown(H1, 0, N1, H2),
    I1 is I + 1,
    sort_down(H2, N, I1, Result).

siftdown(Arr, Idx, N, Result) :-
    Largest is Idx,
    Left is 2 * Idx + 1,
    Right is 2 * Idx + 2,
    (Left < N -> ; Largest1 is Largest),
    (Right < N -> ; Largest2 is Largest1),
    (Largest2 \= Idx -> siftdown(Arr1, Largest2, N, Result) ; Result = Arr).

swap(Arr, I, J, Result) :- Arr = Result.

:- heapsort([5, 2, 8, 1, 9, 3]).
