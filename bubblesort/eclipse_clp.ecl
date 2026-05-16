:- dynamic array/1.

bubble_sort(Arr, Sorted) :-
  sort(0, @<, Arr, Sorted).

?- bubble_sort([5, 2, 8, 1, 9, 3], X), write(X), nl.