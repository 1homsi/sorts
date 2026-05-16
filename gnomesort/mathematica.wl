GnomeSort[lst_] := Module[
    {arr = lst, n = Length[lst], i = 1, tmp},
    While[i <= n,
        If[i == 1 || arr[[i]] >= arr[[i - 1]],
            i++,
            tmp = arr[[i]];
            arr[[i]] = arr[[i - 1]];
            arr[[i - 1]] = tmp;
            i--
        ]
    ];
    arr
]
