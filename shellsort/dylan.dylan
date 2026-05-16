module: shell-sort

define function shell-sort(arr :: <vector>) => (result :: <vector>)
  let n = size(arr);
  let gap = truncate/(n, 2);
  let a = copy-sequence(arr);
  while (gap > 0)
    for (i from gap below n)
      let temp = a[i];
      let j = i;
      while (j >= gap & a[j - gap] > temp)
        a[j] := a[j - gap];
        j := j - gap;
      end while;
      a[j] := temp;
    end for;
    gap := truncate/(gap, 2);
  end while;
  a
end function;

begin
  let arr = vector(64, 34, 25, 12, 22, 11, 90);
  let sorted = shell-sort(arr);
  for (v in sorted) format-out("%d ", v) end;
  format-out("\n");
end;
