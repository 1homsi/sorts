CombSort[arr_] := Module[
  {a = arr, n = Length[arr], gap, sorted, tmp},
  gap = n;
  sorted = False;
  While[!sorted,
    gap = Max[1, Floor[gap / 1.3]];
    If[gap == 1, sorted = True];
    Do[
      If[a[[i]] > a[[i + gap]],
        tmp = a[[i]];
        a[[i]] = a[[i + gap]];
        a[[i + gap]] = tmp;
        sorted = False
      ],
      {i, 1, n - gap}
    ]
  ];
  a
]
