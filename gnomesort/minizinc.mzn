include "globals.mzn";

int: n = 10;
array[1..n] of int: data = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0];

array[1..n] of var int: sorted;

constraint forall(i in 1..n-1)(sorted[i] <= sorted[i+1]);
constraint sort(data, sorted);

solve satisfy;

output [show(sorted)];
