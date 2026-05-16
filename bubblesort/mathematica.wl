BubbleSort[lst_] := Module[{arr = lst, n = Length[lst], swapped = True, tmp},
  While[swapped,
    swapped = False;
    Do[
      If[arr[[i]] > arr[[i + 1]],
        tmp = arr[[i]];
        arr[[i]] = arr[[i + 1]];
        arr[[i + 1]] = tmp;
        swapped = True
      ],
      {i, 1, n - 1}
    ];
    n--
  ];
  arr
]

Print[BubbleSort[{64, 34, 25, 12, 22, 11, 90}]]
