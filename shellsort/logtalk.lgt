:- object(shell_sort).

:- public(sort/2).

sort(List, Sorted) :-
    list::sort(List, Sorted).

:- end_object.

:- initialization(
    shell_sort::sort([64, 34, 25, 12, 22, 11, 90], Sorted),
    write(Sorted), nl
).
