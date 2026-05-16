:- module comb_sort.
:- interface.
:- import_module list, int.
:- pred comb_sort(list(int)::in, list(int)::out) is det.
:- implementation.

comb_sort(List, Sorted) :-
    length(List, N),
    array.from_list(List, Arr0),
    sort_loop(Arr0, N, N, Arr),
    array.to_list(Arr, Sorted).

:- pred sort_loop(array(int)::array_di, int::in, int::in, array(int)::array_uo) is det.
sort_loop(!.Arr, N, Gap, !:Arr) :-
    NewGap = max(1, Gap * 10 / 13),
    pass(!.Arr, N, NewGap, 0, !:Arr, Changed),
    (if NewGap = 1, Changed = no then
        true
    else
        sort_loop(!.Arr, N, NewGap, !:Arr)
    ).

:- pred pass(array(int)::array_di, int::in, int::in, int::in,
             array(int)::array_uo, bool::out) is det.
pass(!.Arr, N, Gap, I, !:Arr, Changed) :-
    (if I + Gap >= N then
        Changed = no
    else
        array.lookup(!.Arr, I, A),
        array.lookup(!.Arr, I + Gap, B),
        (if A > B then
            array.set(I, B, !Arr),
            array.set(I + Gap, A, !Arr),
            pass(!.Arr, N, Gap, I + 1, !:Arr, _),
            Changed = yes
        else
            pass(!.Arr, N, Gap, I + 1, !:Arr, Changed)
        )
    ).
