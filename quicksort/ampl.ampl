param n := 7;
param unsorted {i in 1..n} := if i=1 then 3 else if i=2 then 6 else if i=3 then 8 else if i=4 then 10 else if i=5 then 1 else if i=6 then 2 else 1;

var x {1..n} >= 0;
s.t. sorted_order {i in 1..n-1}: x[i] <= x[i+1];
s.t. permutation {v in {1,2,3,6,8,10}}: sum {i in 1..n} (if x[i] = v then 1 else 0) = sum {i in 1..n} (if unsorted[i] = v then 1 else 0);

minimize obj: 0;
