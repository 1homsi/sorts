pancake_sort([], []).
pancake_sort(L, S) :-
    min_member(M, L),
    select(M, L, Rest),
    pancake_sort(Rest, SR),
    append(SR, [M], S).

:- pancake_sort([5, 2, 8, 1, 9, 3], Sorted),
   format('Pancake Sort: ~w~n', [Sorted]).
