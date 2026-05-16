module: counting-sort

define method counting-sort(arr :: <sequence>) => (sorted :: <sequence>)
  if (empty?(arr))
    arr
  else
    let n = size(arr);
    let min-val = reduce(min, arr[0], arr);
    let max-val = reduce(max, arr[0], arr);
    let range = max-val - min-val + 1;
    let count = make(<vector>, size: range, fill: 0);
    for (v in arr)
      count[v - min-val] := count[v - min-val] + 1;
    end for;
    for (i from 1 below range)
      count[i] := count[i] + count[i - 1];
    end for;
    let output = make(<vector>, size: n, fill: 0);
    for (i from n - 1 to 0 by -1)
      count[arr[i] - min-val] := count[arr[i] - min-val] - 1;
      output[count[arr[i] - min-val]] := arr[i];
    end for;
    output
  end if;
end method;

format-out("%=
", counting-sort(#(4, 2, 2, 8, 3, 3, 1)));
