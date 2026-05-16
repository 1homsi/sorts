:- object(heapsort).

    :- public(sort/2).

    heapify(Arr, N, I, Result) :-
        Left is 2 * I + 1,
        Right is 2 * I + 2,
        (Left < N, nth0(Left, Arr, VL), nth0(I, Arr, VI), VL > VI -> Largest0 = Left ; Largest0 = I),
        (Right < N, nth0(Right, Arr, VR), nth0(Largest0, Arr, VL0), VR > VL0 -> Largest = Right ; Largest = Largest0),
        (Largest =\= I ->
            nth0(I, Arr, VI2),
            nth0(Largest, Arr, VL2),
            replace_nth0(Arr, I, VL2, Arr1),
            replace_nth0(Arr1, Largest, VI2, Arr2),
            heapify(Arr2, N, Largest, Result)
        ;
            Result = Arr
        ).

    sort(Input, Sorted) :-
        length(Input, N),
        Start is N // 2 - 1,
        build_heap(Input, N, Start, Heap),
        sort_loop(Heap, N, N - 1, Sorted).

    build_heap(Arr, _, -1, Arr) :- !.
    build_heap(Arr, N, I, Result) :-
        heapify(Arr, N, I, Arr1),
        I1 is I - 1,
        build_heap(Arr1, N, I1, Result).

    sort_loop(Arr, _, 0, Arr) :- !.
    sort_loop(Arr, N, I, Result) :-
        nth0(0, Arr, V0), nth0(I, Arr, VI),
        replace_nth0(Arr, 0, VI, Arr1),
        replace_nth0(Arr1, I, V0, Arr2),
        heapify(Arr2, I, 0, Arr3),
        I1 is I - 1,
        sort_loop(Arr3, N, I1, Result).

:- end_object.
