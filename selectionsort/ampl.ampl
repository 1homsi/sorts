param n := 5;
param input {i in 1..n} := if i=1 then 5 else if i=2 then 3 else if i=3 then 1 else if i=4 then 4 else 2;

var sorted {i in 1..n} integer;

minimize obj: 0;

subject to
    permutation {i in 1..n}: sorted[i] = sum{j in 1..n: input[j] = i} input[j];
    ordering {i in 1..n-1}: sorted[i] <= sorted[i+1];
