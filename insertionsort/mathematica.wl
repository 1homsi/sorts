InsertionSort[arr_List] := Module[{a = arr, n = Length[arr], key, j},
  Do[
    key = a[[i]];
    j = i - 1;
    While[j >= 1 && a[[j]] > key,
      a[[j + 1]] = a[[j]];
      j--;
    ];
    a[[j + 1]] = key;
  , {i, 2, n}];
  a
]
