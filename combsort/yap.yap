:- dynamic comb_sort_result/1.

comb_sort(List, Sorted) :-
  length(List, Len),
  comb_sort_loop(List, Len, Len, Sorted).

comb_sort_loop(List, _, Gap, List) :- Gap =:= 1, !.
comb_sort_loop(List, Len, Gap, Sorted) :-
  NewGap is (Gap * 10) // 13,
  (NewGap < 1 -> NextGap = 1 ; NextGap = NewGap),
  comb_pass(List, Len, NextGap, NewList),
  comb_sort_loop(NewList, Len, NextGap, Sorted).

comb_pass(List, Len, Gap, List) :- Gap >= Len, !.
comb_pass(List, Len, Gap, Sorted) :-
  comb_pass_helper(List, 0, Len, Gap, Sorted).

comb_pass_helper(List, I, Len, Gap, List) :- I >= Len - Gap, !.
comb_pass_helper(List, I, Len, Gap, Sorted) :-
  I < Len - Gap,
  nth0(I, List, A),
  I2 is I + Gap,
  nth0(I2, List, B),
  (A > B -> swap_list(List, I, I2, NewList) ; NewList = List),
  I1 is I + 1,
  comb_pass_helper(NewList, I1, Len, Gap, Sorted).

swap_list(List, I, J, NewList) :-
  append(Pre, [A|Rest1], List),
  length(Pre, I),
  append(Rest2, [B|Rest3], Rest1),
  I2 is J - I - 1,
  length(Rest2, I2),
  append(Pre, [B|Temp], Temp1),
  append(Rest2, [A|Rest3], Rest2_Rest3),
  append(Temp, Rest2_Rest3, NewList).

:- initialization(main).
main :- comb_sort([5,2,8,1,9,3], X), write(X), nl, halt.
