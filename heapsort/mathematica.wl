heapify[arr_, n_, i_] := Module[{a = arr, largest = i, left = 2i+1, right = 2i+2, tmp},
  If[left <= n && a[[left]] > a[[largest]], largest = left];
  If[right <= n && a[[right]] > a[[largest]], largest = right];
  If[largest != i,
    tmp = a[[i]]; a[[i]] = a[[largest]]; a[[largest]] = tmp;
    a = heapify[a, n, largest]];
  a]

heapsort[lst_] := Module[{arr = lst, n = Length[lst], tmp},
  Do[arr = heapify[arr, n, i], {i, Floor[n/2], 1, -1}];
  Do[tmp = arr[[1]]; arr[[1]] = arr[[i]]; arr[[i]] = tmp;
     arr = heapify[arr, i-1, 1], {i, n, 2, -1}];
  arr]

Print[heapsort[{12, 11, 13, 5, 6, 7}]]
