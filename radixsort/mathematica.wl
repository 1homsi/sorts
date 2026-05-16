countingSort[arr_, exp_] := Module[
  {n = Length[arr], count = Table[0, {10}], output, idx},
  output = Table[0, {n}];
  Do[idx = Mod[Floor[arr[[i]]/exp], 10] + 1;
     count[[idx]]++, {i, 1, n}];
  Do[count[[i]] += count[[i-1]], {i, 2, 10}];
  Do[idx = Mod[Floor[arr[[i]]/exp], 10] + 1;
     output[[count[[idx]]]] = arr[[i]];
     count[[idx]]--, {i, n, 1, -1}];
  output
];

radixSort[arr_] := Module[
  {maxVal = Max[arr], exp = 1, result = arr},
  While[Floor[maxVal/exp] > 0,
    result = countingSort[result, exp];
    exp *= 10];
  result
];

Print[radixSort[{170, 45, 75, 90, 802, 24, 2, 66}]]
