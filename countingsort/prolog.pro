:- initialization(main).

counting_sort([], []).
counting_sort(Arr, Sorted) :-
    min_list(Arr, Min),
    max_list(Arr, Max),
    Range is Max - Min + 1,
    length(Count0, Range),
    maplist(=(0), Count0),
    fill_count(Arr, Min, Count0, Count1),
    prefix_sum(Count1, Count2),
    length(Arr, N),
    length(Output, N),
    maplist(=(0), Output),
    build_output(Arr, Min, Count2, Output, Sorted).

fill_count([], _, Count, Count).
fill_count([H|T], Min, CountIn, CountOut) :-
    I is H - Min + 1,
    nth1(I, CountIn, V),
    V1 is V + 1,
    replace_nth(I, CountIn, V1, CountMid),
    fill_count(T, Min, CountMid, CountOut).

prefix_sum([C], [C]).
prefix_sum([C1, C2 | Rest], [C1 | Sums]) :-
    C2New is C1 + C2,
    prefix_sum([C2New | Rest], Sums).

replace_nth(1, [_|T], V, [V|T]).
replace_nth(N, [H|T], V, [H|T2]) :-
    N > 1, N1 is N - 1,
    replace_nth(N1, T, V, T2).

build_output(Arr, Min, Count, _Output, Sorted) :-
    maplist(copy_term, Count, CountCopy),
    build_output_(Arr, Min, CountCopy, Sorted).

build_output_(Arr, Min, Count, Sorted) :-
    reverse(Arr, RevArr),
    build_output_r(RevArr, Min, Count, [], Sorted).

build_output_r([], _, _, Acc, Acc).
build_output_r([H|T], Min, Count, Acc, Out) :-
    I is H - Min + 1,
    nth1(I, Count, V),
    V1 is V - 1,
    replace_nth(I, Count, V1, Count1),
    build_output_r(T, Min, Count1, [H|Acc], Out).

main :-
    counting_sort([4, 2, 2, 8, 3, 3, 1], Sorted),
    write(Sorted), nl.
