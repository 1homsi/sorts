:-module(bucket_sort).
:-use_module(library(lists)).

bucket_sort(Arr, MaxVal, Result) :-
    length(Arr, _),
    findall(I-Num, (member(Num, Arr), I is Num), Pairs),
    keysort(Pairs, Sorted),
    pairs_values(Sorted, Result).

:-dynamic test/1.
test([5, 2, 8, 1, 9, 3]).

:-initialization(main).
main :-
    test(Arr),
    bucket_sort(Arr, 10, Result),
    write(Result), nl.
