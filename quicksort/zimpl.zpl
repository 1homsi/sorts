set I := {1..7};
param data[I] := <1> 3, <2> 6, <3> 8, <4> 10, <5> 1, <6> 2, <7> 1;

var sorted[I] integer >= 0 <= 100;

subto order: forall <i> in I with i < 7: sorted[i] <= sorted[i+1];

minimize cost: 0;
