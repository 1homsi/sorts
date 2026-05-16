:- dynamic arr/2.

swap(I, J) :-
    arr(I, VI), arr(J, VJ),
    retract(arr(I, VI)), retract(arr(J, VJ)),
    assert(arr(I, VJ)), assert(arr(J, VI)).

stooge_sort(First, Last) :-
    arr(First, A), arr(Last, B),
    (A > B -> swap(First, Last) ; true),
    N is Last - First + 1,
    (N > 2 ->
        T is (N * 2) // 3,
        Mid1 is First + T - 1,
        Mid2 is Last - T + 1,
        stooge_sort(First, Mid1),
        stooge_sort(Mid2, Last),
        stooge_sort(First, Mid1)
    ; true).

:- assert(arr(0,3)), assert(arr(1,1)), assert(arr(2,4)), assert(arr(3,1)),
   assert(arr(4,5)), assert(arr(5,9)), assert(arr(6,2)), assert(arr(7,6)).

:- stooge_sort(0, 7),
   forall(arr(_, V), (write(V), write(' '))), nl.
