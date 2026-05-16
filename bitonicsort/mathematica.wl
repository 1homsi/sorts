compareAndSwap[arr_, i_, j_, direction_] := Module[{a = arr},
  If[direction === (a[[i]] > a[[j]]),
    {a[[i]], a[[j]]} = {a[[j]], a[[i]]}
  ];
  a
]

bitonicMerge[arr_, lo_, cnt_, direction_] := Module[{a = arr, k, i},
  If[cnt > 1,
    k = Floor[cnt/2];
    Do[a = compareAndSwap[a, i, i + k, direction], {i, lo, lo + k - 1}];
    a = bitonicMerge[a, lo, k, direction];
    a = bitonicMerge[a, lo + k, k, direction]
  ];
  a
]

bitonicSort[arr_, lo_, cnt_, direction_] := Module[{a = arr, k},
  If[cnt > 1,
    k = Floor[cnt/2];
    a = bitonicSort[a, lo, k, True];
    a = bitonicSort[a, lo + k, k, False];
    a = bitonicMerge[a, lo, cnt, direction]
  ];
  a
]

data = {3, 7, 4, 8, 6, 2, 1, 5};
Print[bitonicSort[data, 1, Length[data], True]]
