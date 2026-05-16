:- object(cocktail_sort).

    :- public(sort/2).
    :- mode(sort(+list(integer), -list(integer)), one).

    sort(List, Sorted) :-
        list::length(List, N),
        list_to_array(List, Arr),
        cocktail_loop(Arr, N, 0, N-1, true),
        array_to_list(Arr, Sorted).

    cocktail_loop(_, _, _, _, false) :- !.
    cocktail_loop(Arr, N, Start, End, true) :-
        forward_pass(Arr, Start, End, false, Sw1),
        ( Sw1 = false ->
            true
        ;
            End1 is End - 1,
            backward_pass(Arr, Start, End1, false, Sw2),
            Start1 is Start + 1,
            cocktail_loop(Arr, N, Start1, End1, Sw2)
        ).

    forward_pass(_, I, End, Sw, Sw) :- I >= End, !.
    forward_pass(Arr, I, End, _, Sw) :-
        I1 is I + 1,
        get_elem(Arr, I, A),
        get_elem(Arr, I1, B),
        ( A > B ->
            set_elem(Arr, I, B),
            set_elem(Arr, I1, A),
            forward_pass(Arr, I1, End, true, Sw)
        ;
            forward_pass(Arr, I1, End, false, Sw)
        ).

    backward_pass(_, I, Start, Sw, Sw) :- I < Start, !.
    backward_pass(Arr, I, Start, _, Sw) :-
        I1 is I + 1,
        get_elem(Arr, I, A),
        get_elem(Arr, I1, B),
        I2 is I - 1,
        ( A > B ->
            set_elem(Arr, I, B),
            set_elem(Arr, I1, A),
            backward_pass(Arr, I2, Start, true, Sw)
        ;
            backward_pass(Arr, I2, Start, false, Sw)
        ).

:- end_object.
