:- use_module(library(lists)).

swap(Arr, I, J, Arr2) :-
    nth0(I, Arr, VI),
    nth0(J, Arr, VJ),
    nth0(I, Arr, _, Tmp),
    nth0(I, Tmp, VJ, Tmp2),
    nth0(J, Arr, _, Tmp3),
    nth0(J, Tmp3, VI, Arr2).

heapify(Arr, N, I, ArrOut) :-
    Largest0 = I,
    Left is 2 * I + 1,
    Right is 2 * I + 2,
    (Left < N, nth0(Left, Arr, VL), nth0(Largest0, Arr, VLargest0), VL > VLargest0 -> Largest1 = Left ; Largest1 = Largest0),
    (Right < N, nth0(Right, Arr, VR), nth0(Largest1, Arr, VLargest1), VR > VLargest1 -> Largest = Right ; Largest = Largest1),
    (Largest \= I ->
        swap(Arr, I, Largest, Arr1),
        heapify(Arr1, N, Largest, ArrOut)
    ;
        ArrOut = Arr
    ).

build_heap(Arr, N, ArrOut) :-
    Start is N // 2 - 1,
    build_heap_loop(Arr, N, Start, ArrOut).

build_heap_loop(Arr, _, -1, Arr) :- !.
build_heap_loop(Arr, N, I, ArrOut) :-
    heapify(Arr, N, I, Arr1),
    I1 is I - 1,
    build_heap_loop(Arr1, N, I1, ArrOut).

sort_loop(Arr, 0, Arr) :- !.
sort_loop(Arr, I, ArrOut) :-
    swap(Arr, 0, I, Arr1),
    heapify(Arr1, I, 0, Arr2),
    I1 is I - 1,
    sort_loop(Arr2, I1, ArrOut).

heapsort(List, Sorted) :-
    length(List, N),
    build_heap(List, N, Heap),
    I is N - 1,
    sort_loop(Heap, I, Sorted).

:- heapsort([12,11,13,5,6,7], S), write(S), nl.
