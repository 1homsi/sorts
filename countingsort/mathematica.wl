CountingSort[arr_] := Module[
  {min, max, range, count, output, n, idx},
  If[arr == {}, Return[arr]];
  min = Min[arr]; max = Max[arr];
  range = max - min + 1;
  count = Table[0, {range}];
  Do[count[[arr[[i]] - min + 1]]++, {i, 1, Length[arr]}];
  Do[count[[i]] += count[[i - 1]], {i, 2, range}];
  n = Length[arr];
  output = Table[0, {n}];
  Do[
    idx = arr[[i]] - min + 1;
    output[[count[[idx]]]] = arr[[i]];
    count[[idx]]--,
    {i, n, 1, -1}
  ];
  output
]

Print[CountingSort[{4, 2, 2, 8, 3, 3, 1}]]
