insertion_sort := proc(arr)
  local a, n, i, key, j;
  a := [op(arr)];
  n := nops(a);
  for i from 2 to n do
    key := a[i];
    j := i - 1;
    while j >= 1 and a[j] > key do
      a[j+1] := a[j];
      j := j - 1;
    end do;
    a[j+1] := key;
  end do;
  a;
end proc;
