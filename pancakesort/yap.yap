pancake_sort([], []).
pancake_sort(L, S) :-
    min_list(L, Min),
    select(Min, L, Rest),
    pancake_sort(Rest, SR),
    append(SR, [Min], S).

:- pancake_sort([5, 2, 8, 1, 9, 3], Sorted),
   write('Pancake Sort: '), writeln(Sorted).
