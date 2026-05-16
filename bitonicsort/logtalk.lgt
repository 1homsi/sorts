:- object(bitonic_sort).

    :- public(sort/2).

    sort(List, Sorted) :-
        length(List, N),
        bitonic_sort(List, 0, N, true, Sorted).

    bitonic_sort(List, _, Cnt, _, List) :- Cnt =< 1, !.
    bitonic_sort(List, Lo, Cnt, Dir, Sorted) :-
        K is Cnt // 2,
        Lo2 is Lo + K,
        bitonic_sort(List, Lo, K, true, List2),
        bitonic_sort(List2, Lo2, K, false, List3),
        bitonic_merge(List3, Lo, Cnt, Dir, Sorted).

    bitonic_merge(List, _, Cnt, _, List) :- Cnt =< 1, !.
    bitonic_merge(List, Lo, Cnt, Dir, Result) :-
        K is Cnt // 2,
        Lo2 is Lo + K,
        merge_pairs(List, Lo, K, Lo2, Dir, List2),
        bitonic_merge(List2, Lo, K, Dir, List3),
        bitonic_merge(List3, Lo2, K, Dir, Result).

    merge_pairs(List, Start, K, Base, Dir, Result) :-
        End is Start + K,
        merge_loop(List, Start, End, Base, Dir, 0, Result).

    merge_loop(List, Start, End, _, _, Off, List) :-
        Start + Off >= End, !.
    merge_loop(List, Start, End, Base, Dir, Off, Result) :-
        I is Start + Off, J is Base + Off,
        compare_and_swap(List, I, J, Dir, List2),
        Off2 is Off + 1,
        merge_loop(List2, Start, End, Base, Dir, Off2, Result).

    compare_and_swap(List, I, J, Dir, Result) :-
        nth0(I, List, AI), nth0(J, List, AJ),
        (Dir == true, AI > AJ ; Dir == false, AI < AJ),
        nth0_set(List, I, AJ, Tmp), nth0_set(Tmp, J, AI, Result), !.
    compare_and_swap(List, _, _, _, List).

    nth0_set([_|T], 0, V, [V|T]) :- !.
    nth0_set([H|T], I, V, [H|R]) :- I > 0, I2 is I - 1, nth0_set(T, I2, V, R).

:- end_object.

:- initialization(
    bitonic_sort::sort([3,7,4,8,6,2,1,5], Sorted),
    write(Sorted), nl
).
