StoogeSort[arr_List, first_Integer, last_Integer] := Module[
    {a = arr, tmp, t},
    If[a[[first]] > a[[last]],
        tmp = a[[first]];
        a[[first]] = a[[last]];
        a[[last]] = tmp
    ];
    If[last - first + 1 > 2,
        t = Floor[(last - first + 1) * 2 / 3];
        a = StoogeSort[a, first, first + t - 1];
        a = StoogeSort[a, last - t + 1, last];
        a = StoogeSort[a, first, first + t - 1]
    ];
    a
]

arr = {3, 1, 4, 1, 5, 9, 2, 6};
result = StoogeSort[arr, 1, Length[arr]];
Print[result]
