flip(List, K, Result) :-
    length(Prefix, K1), K1 is K + 1,
    append(Prefix, Suffix, List),
    reverse(Prefix, RevPrefix),
    append(RevPrefix, Suffix, Result).

max_idx(List, Size, MaxIdx) :-
    length(Sub, Size),
    append(Sub, _, List),
    max_member(Max, Sub),
    nth0(MaxIdx, Sub, Max).

pancake_sort(List, Sorted) :-
    length(List, N),
    sort_step(List, N, Sorted).

sort_step(List, 1, List) :- !.
sort_step(List, Size, Sorted) :-
    max_idx(List, Size, MaxIdx),
    Last is Size - 1,
    (MaxIdx =:= Last ->
        L1 = List
    ;
        (MaxIdx =:= 0 ->
            L0 = List
        ;
            flip(List, MaxIdx, L0)
        ),
        flip(L0, Last, L1)
    ),
    Size1 is Size - 1,
    sort_step(L1, Size1, Sorted).

:- pancake_sort([3,6,2,7,4,1,5], S), write(S), nl.
