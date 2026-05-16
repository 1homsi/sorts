bogosort(List, List) :- sorted(List), !.
bogosort(List, Sorted) :- shuffle(List, S), bogosort(S, Sorted).
