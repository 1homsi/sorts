include "globals.mzn";

int: n = 7;
array[1..n] of int: unsorted = [3, 6, 8, 10, 1, 2, 1];

array[1..n] of var int: sorted;

constraint forall(i in 1..n-1)(sorted[i] <= sorted[i+1]);
constraint sort(unsorted, sorted);

solve satisfy;

output [show(sorted[i]) ++ "\n" | i in 1..n];
