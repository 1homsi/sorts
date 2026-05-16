param n := 10;
param data {i in 1..n} := if i=1 then 5 else if i=2 then 3 else if i=3 then 8
    else if i=4 then 1 else if i=5 then 9 else if i=6 then 2
    else if i=7 then 7 else if i=8 then 4 else if i=9 then 6 else 0;

var arr {1..n} >= 0;
var sorted {1..n} >= 0;

minimize obj: sum {i in 1..n} sorted[i];

subject to sorted_order {i in 1..n-1}: sorted[i] <= sorted[i+1];
subject to permutation {v in 0..9}:
    sum {i in 1..n: data[i] = v} 1 = sum {i in 1..n: sorted[i] = v} 1;
