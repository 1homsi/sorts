isSorted[arr_] := And @@ MapThread[LessEqual, {Most[arr], Rest[arr]}]

bogosort[arr_] := Module[{a = arr},
  While[!isSorted[a], a = RandomSample[a]];
  a]

Print[bogosort[{3, 1, 4, 1, 5, 9, 2, 6}]]
