define method shell-sort(arr :: <simple-object-vector>, n :: <integer>)
 => (result :: <simple-object-vector>)
  let gap = truncate/(n, 2);
  while (gap > 0)
    for (i from gap below n)
      let temp = arr[i];
      let j = i;
      while (j >= gap & arr[j - gap] > temp)
        arr[j] := arr[j - gap];
        j := j - gap;
      end while;
      arr[j] := temp;
    end for;
    gap := truncate/(gap, 2);
  end while;
  arr
end method;

let arr = vector(64, 34, 25, 12, 22, 11, 90);
shell-sort(arr, 7);
for (v in arr) format-out("%d ", v) end;
format-out("\n");
