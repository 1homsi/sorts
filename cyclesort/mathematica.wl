cycleSort[list_] := Module[
  {arr = list, n = Length[list], writes = 0, item, pos, tmp},
  Do[
    item = arr[[cycleStart]];
    pos = cycleStart;
    Do[
      If[arr[[i]] < item, pos++],
      {i, cycleStart + 1, n}
    ];
    If[pos != cycleStart,
      While[item == arr[[pos]], pos++];
      tmp = arr[[pos]]; arr[[pos]] = item; item = tmp;
      writes++;
      While[pos != cycleStart,
        pos = cycleStart;
        Do[If[arr[[i]] < item, pos++], {i, cycleStart + 1, n}];
        While[item == arr[[pos]], pos++];
        tmp = arr[[pos]]; arr[[pos]] = item; item = tmp;
        writes++
      ]
    ],
    {cycleStart, 1, n - 1}
  ];
  arr
]

Print[cycleSort[{5, 4, 3, 2, 1}]]
