int: n = 5;
array[1..n] of int: arr = [5, 3, 1, 4, 2];
array[1..n] of var int: sorted;

constraint forall(i in 1..n)(
    sorted[i] = arr[i]
);
constraint forall(i in 1..n-1)(
    sorted[i] <= sorted[i+1]
);

solve satisfy;

output [show(sorted)];
