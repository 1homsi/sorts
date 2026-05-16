set I := {1..5};
param a[I] := <1> 5, <2> 3, <3> 1, <4> 4, <5> 2;
var x[I] integer >= 1 <= 5;

minimize cost: sum <i> in I: x[i];

subto ordering: forall <i> in I with i < max(I): x[i] <= x[i+1];
