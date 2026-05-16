set I := {1..10};
param data[I] := <1> 5, <2> 3, <3> 8, <4> 1, <5> 9, <6> 2, <7> 7, <8> 4, <9> 6, <10> 0;
var sorted[I] integer >= 0;

minimize cost: sum <i> in I: sorted[i];

subto ordered: forall <i> in {1..9}: sorted[i] <= sorted[i+1];
