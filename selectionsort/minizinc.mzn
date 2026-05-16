int: n = 5;
array[1..n] of int: input = [5, 3, 1, 4, 2];
array[1..n] of var int: sorted;

constraint sort(input) = sorted;
constraint forall(i in 1..n)(sorted[i] in 1..5);
constraint alldifferent(sorted);

solve satisfy;
output [show(sorted)];
