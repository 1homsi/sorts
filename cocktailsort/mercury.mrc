:- module cocktail_sort.
:- interface.
:- import_module list.

:- pred cocktail_sort(list(int)::in, list(int)::out) is det.

:- implementation.
:- import_module array, int, bool.

cocktail_sort(List, Sorted) :-
    array.from_list(List, Arr0),
    array.size(Arr0, N),
    cocktail_loop(Arr0, Arr, yes, 0, N - 1),
    array.to_list(Arr, Sorted).

:- pred cocktail_loop(array(int)::array_di, array(int)::array_uo,
    bool::in, int::in, int::in) is det.

cocktail_loop(Arr, Arr, no, _, _).
cocktail_loop(Arr0, Arr, yes, Start, End) :-
    forward_pass(Arr0, Arr1, no, Sw1, Start, End),
    (
        Sw1 = no,
        Arr = Arr1
    ;
        Sw1 = yes,
        End1 = End - 1,
        backward_pass(Arr1, Arr2, no, Sw2, Start, End1),
        Start1 = Start + 1,
        cocktail_loop(Arr2, Arr, Sw2, Start1, End1)
    ).

:- pred forward_pass(array(int)::array_di, array(int)::array_uo,
    bool::in, bool::out, int::in, int::in) is det.

forward_pass(Arr, Arr, Sw, Sw, I, End) :- I >= End.
forward_pass(Arr0, Arr, _Sw0, Sw, I, End) :-
    I < End,
    array.lookup(Arr0, I, A),
    array.lookup(Arr0, I + 1, B),
    ( A > B ->
        array.set(I, B, Arr0, Arr1),
        array.set(I + 1, A, Arr1, Arr2),
        forward_pass(Arr2, Arr, yes, Sw, I + 1, End)
    ;
        forward_pass(Arr0, Arr, no, Sw, I + 1, End)
    ).

:- pred backward_pass(array(int)::array_di, array(int)::array_uo,
    bool::in, bool::out, int::in, int::in) is det.

backward_pass(Arr, Arr, Sw, Sw, Start, I) :- I < Start.
backward_pass(Arr0, Arr, _Sw0, Sw, Start, I) :-
    I >= Start,
    array.lookup(Arr0, I, A),
    array.lookup(Arr0, I + 1, B),
    ( A > B ->
        array.set(I, B, Arr0, Arr1),
        array.set(I + 1, A, Arr1, Arr2),
        backward_pass(Arr2, Arr, yes, Sw, Start, I - 1)
    ;
        backward_pass(Arr0, Arr, no, Sw, Start, I - 1)
    ).
