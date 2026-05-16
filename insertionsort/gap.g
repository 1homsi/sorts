InsertionSort := function(arr)
  local a, n, i, key, j;
  a := ShallowCopy(arr);
  n := Length(a);
  for i in [2..n] do
    key := a[i];
    j := i - 1;
    while j >= 1 and a[j] > key do
      a[j+1] := a[j];
      j := j - 1;
    od;
    a[j+1] := key;
  od;
  return a;
end;
