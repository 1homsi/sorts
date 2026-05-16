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
    arg(K, L0, V1),
    arg(K, L0, V2),
    V1 > V2, !,
    arg(K, L0, V1),
    arg(K + 1, L0, V2),
    forward_pass(L0, K + 1, N, I, L, true).
forward_pass(L, K, N, I, L2, S) :-
    forward_pass(L, K + 1, N, I, L2, S).
