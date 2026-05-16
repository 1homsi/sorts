cocktail_sort(List, Sorted) :-
    length(List, N),
    cocktail_helper(List, 0, N, Sorted).

cocktail_helper(L, I, N, L) :- I >= N, !.
cocktail_helper(L0, I, N, L) :-
    forward_pass(L0, 0, N, I, L1, false),
    backward_pass(L1, N, I, L2, false),
    I1 is I + 2,
    cocktail_helper(L2, I1, N, L).

forward_pass(L, K, N, I, L, false) :- K >= N - I - 1, !.
forward_pass(L0, K, N, I, L, true) :-
    nth0(K, L0, V1),
    K1 is K + 1,
    nth0(K1, L0, V2),
    V1 > V2, !,
    swap_list(L0, K, K1, L1),
    forward_pass(L1, K1, N, I, L, true).
forward_pass(L, K, N, I, L2, S) :-
    K1 is K + 1,
    forward_pass(L, K1, N, I, L2, S).

swap_list(L0, I, J, L) :-
    nth0(I, L0, VI),
    nth0(J, L0, VJ),
    append(L0Pre, [VI|L0Rest1], L0),
    append(L0Pre, [VJ|L0Rest2], L1),
    length(L0Pre, I),
    append(L1Pre, [VJ|L1Rest], L1),
    length(L1Pre, J),
    L = L1.

test :- 
    cocktail_sort([5, 2, 8, 1, 9, 3], Sorted),
    write('Sorted: '), write(Sorted), nl.
