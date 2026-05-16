insertionSort[bucket_] := Module[{arr = bucket, n = Length[bucket], key, j},
  Do[
    key = arr[[i]];
    j = i - 1;
    While[j >= 1 && arr[[j]] > key,
      arr[[j + 1]] = arr[[j]];
      j--
    ];
    arr[[j + 1]] = key,
    {i, 2, n}
  ];
  arr
]

bucketSort[arr_] := Module[{n = Length[arr], minV, maxV, buckets, idx, result},
  If[n == 0, Return[arr]];
  minV = Min[arr];
  maxV = Max[arr];
  buckets = Table[{}, {n}];
  Do[
    idx = Min[n, Floor[(arr[[i]] - minV)/(maxV - minV + 1)*n] + 1];
    AppendTo[buckets[[idx]], arr[[i]]],
    {i, 1, n}
  ];
  result = {};
  Do[
    result = Join[result, insertionSort[buckets[[i]]]],
    {i, 1, n}
  ];
  result
]

Print[bucketSort[{0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68}]]
