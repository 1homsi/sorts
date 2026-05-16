:- use_module(library(lists)).

compare_and_swap(Arr, I, J, Dir, NewArr) :-
    nth0(I, Arr, AI),
    nth0(J, Arr, AJ),
    (   Dir == asc, AI > AJ
    ->  set_element(Arr, I, AJ, Tmp), set_element(Tmp, J, AI, NewArr)
    ;   Dir == desc, AI < AJ
    ->  set_element(Arr, I, AJ, Tmp), set_element(Tmp, J, AI, NewArr)
    ;   NewArr = Arr
    ).

set_element(List, Idx, Val, NewList) :-
    length(Prefix, Idx),
    append(Prefix, [_|Rest], List),
    append(Prefix, [Val|Rest], NewList).

bitonic_merge(Arr, _Lo, Cnt, _Dir, Arr) :- Cnt =< 1, !.
bitonic_merge(Arr, Lo, Cnt, Dir, Result) :-
    K is Cnt // 2,
    LoK is Lo + K,
    merge_pairs(Arr, Lo, K, LoK, Dir, Arr2),
    bitonic_merge(Arr2, Lo, K, Dir, Arr3),
    bitonic_merge(Arr3, LoK, K, Dir, Result).

merge_pairs(Arr, Lo, K, LoK, Dir, Result) :-
    End is Lo + K,
    merge_pairs_loop(Arr, Lo, End, LoK, Dir, 0, Result).

merge_pairs_loop(Arr, Start, End, _Base, _Dir, Offset, Arr) :-
    Start + Offset >= End, !.
merge_pairs_loop(Arr, Start, End, Base, Dir, Offset, Result) :-
    I is Start + Offset,
    J is Base + Offset,
    compare_and_swap(Arr, I, J, Dir, Arr2),
    Off2 is Offset + 1,
    merge_pairs_loop(Arr2, Start, End, Base, Dir, Off2, Result).

bitonic_sort(Arr, _Lo, Cnt, _Dir, Arr) :- Cnt =< 1, !.
bitonic_sort(Arr, Lo, Cnt, Dir, Result) :-
    K is Cnt // 2,
    LoK is Lo + K,
    bitonic_sort(Arr, Lo, K, asc, Arr2),
    bitonic_sort(Arr2, LoK, K, desc, Arr3),
    bitonic_merge(Arr3, Lo, Cnt, Dir, Result).

:- initialization(main).
main :-
    Data = [3, 7, 4, 8, 6, 2, 1, 5],
    bitonic_sort(Data, 0, 8, asc, Sorted),
    write(Sorted), nl.
