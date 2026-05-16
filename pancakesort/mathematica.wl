flip[arr_, k_] := Join[Reverse[arr[[1;;k+1]]], arr[[k+2;;]]]

findMaxIdx[arr_, size_] := First[Ordering[arr[[1;;size]], -1]] - 1

pancakeSort[arr_] := Module[{a = arr, size = Length[arr], maxIdx},
  While[size > 1,
    maxIdx = findMaxIdx[a, size];
    If[maxIdx != size - 1,
      If[maxIdx != 0, a = flip[a, maxIdx]];
      a = flip[a, size - 1]
    ];
    size--
  ];
  a
]

Print[pancakeSort[{3, 6, 2, 7, 4, 1, 5}]]
