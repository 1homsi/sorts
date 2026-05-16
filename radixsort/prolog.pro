:- initialization main.

counting_sort(List, Exp, Sorted) :-
    maplist(digit(Exp), List, Digits),
    numlist(0, 9, Ds),
    maplist(bucket(List, Digits), Ds, Buckets),
    append(Buckets, Sorted).

digit(Exp, X, D) :- D is (X // Exp) mod 10.

bucket(List, Digits, D, Bucket) :-
    findall(X, (nth0(I, List, X), nth0(I, Digits, D)), Bucket).

max_list([X], X).
max_list([X|T], Max) :-
    max_list(T, MaxT),
    Max is max(X, MaxT).

radix_sort([], []).
radix_sort(List, Sorted) :-
    max_list(List, Max),
    radix_loop(List, Max, 1, Sorted).

radix_loop(List, Max, Exp, Sorted) :-
    (Max // Exp > 0 ->
        counting_sort(List, Exp, NewList),
        Exp1 is Exp * 10,
        radix_loop(NewList, Max, Exp1, Sorted)
    ;
        Sorted = List).

main :-
    radix_sort([170, 45, 75, 90, 802, 24, 2, 66], S),
    write(S), nl.
