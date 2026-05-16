CocktailSort[lst_] := Module[
  {arr = lst, n = Length[lst], swapped = True, start = 1, end = Length[lst], tmp},
  While[swapped,
    swapped = False;
    Do[
      If[arr[[i]] > arr[[i + 1]],
        tmp = arr[[i]];
        arr[[i]] = arr[[i + 1]];
        arr[[i + 1]] = tmp;
        swapped = True],
      {i, start, end - 1}];
    If[!swapped, Break[]];
    swapped = False;
    end = end - 1;
    Do[
      If[arr[[i]] > arr[[i + 1]],
        tmp = arr[[i]];
        arr[[i]] = arr[[i + 1]];
        arr[[i + 1]] = tmp;
        swapped = True],
      {i, end - 1, start, -1}];
    start = start + 1];
  arr]
