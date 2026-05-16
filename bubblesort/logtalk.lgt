:- object(bubble_sort).

    :- public(sort/2).

    sort(List, Sorted) :-
        bubble_pass(List, List1, Swapped),
        (Swapped = true -> sort(List1, Sorted) ; Sorted = List1).

    bubble_pass([], [], false).
    bubble_pass([X], [X], false).
    bubble_pass([X, Y | Rest], [Y | Sorted], true) :-
        X > Y, !,
        bubble_pass([X | Rest], Sorted, _).
    bubble_pass([X | Rest], [X | Sorted], Swapped) :-
        bubble_pass(Rest, Sorted, Swapped).

:- end_object.

:- initialization(
    bubble_sort::sort([64, 34, 25, 12, 22, 11, 90], Sorted),
    write(Sorted), nl
).
