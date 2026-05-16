:- module mergesort.
:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is det.

:- implementation.
:- import_module list, int.

:- pred merge_sort(list(int)::in, list(int)::out) is det.
:- pred merge(list(int)::in, list(int)::in, list(int)::out) is det.

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(List, Sorted) :-
    List = [_,_|_],
    length(List, Len),
    Mid = Len // 2,
    length(Left, Mid),
    append(Left, Right, List),
    merge_sort(Left, SortedLeft),
    merge_sort(Right, SortedRight),
    merge(SortedLeft, SortedRight, Sorted).

merge([], Right, Right).
merge(Left, [], Left).
merge([Lh|Lt], [Rh|Rt], Result) :-
    ( Lh =< Rh ->
        merge(Lt, [Rh|Rt], Rest),
        Result = [Lh|Rest]
    ;
        merge([Lh|Lt], Rt, Rest),
        Result = [Rh|Rest]
    ).

main(!IO) :-
    merge_sort([38,27,43,3,9,82,10], Sorted),
    write(Sorted, !IO),
    nl(!IO).
