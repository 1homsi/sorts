set INDICES := 1..5;
param n := 5;
param arr{INDICES} default 0;

let arr[1] := 5;
let arr[2] := 3;
let arr[3] := 1;
let arr[4] := 4;
let arr[5] := 2;

for {i in 2..n} {
    let {j in i..n: j > 1} arr[j] :=
        if arr[j-1] > arr[j] then arr[j-1] else arr[j];
}

display arr;
