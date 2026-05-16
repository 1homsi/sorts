:- module selection_sort.
:- interface.
:- import_module list, int.
:- pred selection_sort(list(int)::in, list(int)::out) is det.
:- implementation.

selection_sort([], []).
selection_sort([H|T], Sorted) :-
    list.min_member(Min, [H|T]),
    list.delete_first([H|T], Min, Rest),
    selection_sort(Rest, SortedRest),
    Sorted = [Min|SortedRest].
