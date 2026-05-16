ShellSort[lst_] := Module[
  {arr = lst, n = Length[lst], gap, i, j, temp},
  gap = Floor[n/2];
  While[gap > 0,
    For[i = gap + 1, i <= n, i++,
      temp = arr[[i]];
      j = i;
      While[j > gap && arr[[j - gap]] > temp,
        arr[[j]] = arr[[j - gap]];
        j -= gap;
      ];
      arr[[j]] = temp;
    ];
    gap = Floor[gap/2];
  ];
  arr
]

arr = {64, 34, 25, 12, 22, 11, 90};
Print[ShellSort[arr]]
