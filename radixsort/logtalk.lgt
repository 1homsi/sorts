:- object(radix_sort).

    :- public(sort/2).
    :- public(counting_sort/3).

    get_digit(X, Exp, D) :- D is (X // Exp) mod 10.

    counting_sort(Xs, Exp, Sorted) :-
        numlist(0, 9, Digits),
        maplist([D, Bucket]>>(include([X]>>(get_digit(X, Exp, DX), DX =:= D), Xs, Bucket)), Digits, Buckets),
        flatten(Buckets, Sorted).

    sort([], []).
    sort(Xs, Sorted) :-
        Xs \= [],
        max_list(Xs, Max),
        sort_loop(Xs, Max, 1, Sorted).

    sort_loop(Xs, Max, Exp, Result) :-
        (Max // Exp =:= 0 -> Result = Xs
        ;
            counting_sort(Xs, Exp, NewXs),
            Exp1 is Exp * 10,
            sort_loop(NewXs, Max, Exp1, Result)
        ).

:- end_object.

:- initialization(
    radix_sort::sort([170, 45, 75, 90, 802, 24, 2, 66], S),
    write(S), nl
).
