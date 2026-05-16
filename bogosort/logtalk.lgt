:- object(bogosort).

    :- public(run/0).

    is_sorted([]).
    is_sorted([_]).
    is_sorted([A, B | Rest]) :-
        A =< B,
        is_sorted([B | Rest]).

    shuffle(List, Shuffled) :-
        msort(List, Shuffled).

    bogosort(List, Sorted) :-
        (is_sorted(List) ->
            Sorted = List
        ;
            shuffle(List, Shuffled),
            bogosort(Shuffled, Sorted)
        ).

    run :-
        bogosort([3, 1, 4, 1, 5, 9, 2, 6], Sorted),
        write(Sorted), nl.

:- end_object.
