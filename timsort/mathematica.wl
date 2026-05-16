minRun = 32;

insertionSort[arr_, left_, right_] := Module[{a = arr, key, j},
  Do[
    key = a[[i]];
    j = i - 1;
    While[j >= left && a[[j]] > key,
      a[[j + 1]] = a[[j]];
      j--;
    ];
    a[[j + 1]] = key;
  , {i, left + 1, right}];
  a
];

mergeRuns[arr_, left_, mid_, right_] := Module[
  {a = arr, lp, rp, i = 1, j = 1, k = left},
  lp = arr[[left ;; mid]];
  rp = arr[[mid + 1 ;; right]];
  While[i <= Length[lp] && j <= Length[rp],
    If[lp[[i]] <= rp[[j]],
      a[[k]] = lp[[i]]; i++,
      a[[k]] = rp[[j]]; j++
    ];
    k++;
  ];
  While[i <= Length[lp], a[[k]] = lp[[i]]; i++; k++];
  While[j <= Length[rp], a[[k]] = rp[[j]]; j++; k++];
  a
];

timsort[lst_] := Module[{arr = lst, n, i, size, left, mid, right},
  n = Length[arr];
  i = 1;
  While[i <= n,
    arr = insertionSort[arr, i, Min[i + minRun - 1, n]];
    i += minRun;
  ];
  size = minRun;
  While[size < n,
    left = 1;
    While[left <= n,
      mid = Min[left + size - 1, n];
      right = Min[left + 2*size - 1, n];
      If[mid < right, arr = mergeRuns[arr, left, mid, right]];
      left += 2*size;
    ];
    size *= 2;
  ];
  arr
];

Print[timsort[{5, 2, 8, 1, 9, 3, 7, 4, 6}]]
