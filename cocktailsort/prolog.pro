cocktail_sort(List, Sorted) :-
    list_to_array(List, Arr, Len),
    Start is 0,
    End is Len - 1,
    cocktail_loop(Arr, Start, End, true),
    array_to_list(Arr, Sorted).

cocktail_loop(_, _, _, false) :- !.
cocktail_loop(Arr, Start, End, true) :-
    forward_pass(Arr, Start, End, false, Sw1),
    (Sw1 = false -> true ;
        End1 is End - 1,
        backward_pass(Arr, Start, End1, false, Sw2),
        Start1 is Start + 1,
        cocktail_loop(Arr, Start1, End1, Sw2)).

forward_pass(_, I, End, Sw, Sw) :- I >= End, !.
forward_pass(Arr, I, End, _, Sw) :-
    I1 is I + 1,
    get_array(Arr, I, A),
    get_array(Arr, I1, B),
    (A > B ->
        set_array(Arr, I, B),
        set_array(Arr, I1, A),
        forward_pass(Arr, I1, End, true, Sw)
    ;
        forward_pass(Arr, I1, End, false, Sw)).

backward_pass(_, I, Start, Sw, Sw) :- I < Start, !.
backward_pass(Arr, I, Start, _, Sw) :-
    I1 is I + 1,
    get_array(Arr, I, A),
    get_array(Arr, I1, B),
    (A > B ->
        set_array(Arr, I, B),
        set_array(Arr, I1, A),
        I2 is I - 1,
        backward_pass(Arr, I2, Start, true, Sw)
    ;
        I2 is I - 1,
        backward_pass(Arr, I2, Start, false, Sw)).
