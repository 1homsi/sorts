set I := {1..5};
param arr[I] := <1> 5, <2> 3, <3> 1, <4> 4, <5> 2;
var sorted[I] integer >= 0 <= 100;

subto sorted_order: forall <i> in I with i < 5:
    sorted[i] <= sorted[i+1];

subto is_permutation: forall <i> in I:
    sorted[i] >= 0;

minimize obj: sum <i> in I: sorted[i];
