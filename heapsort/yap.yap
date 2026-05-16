:- dynamic arr/2.

assert_array :-
    assertz(arr(0, 5)),
    assertz(arr(1, 2)),
    assertz(arr(2, 8)),
    assertz(arr(3, 1)),
    assertz(arr(4, 9)),
    assertz(arr(5, 3)).

heapsort :-
    assert_array,
    findall(X, arr(_, X), List),
    write(List), nl.

:- heapsort.
